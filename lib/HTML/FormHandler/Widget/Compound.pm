package HTML::FormHandler::Widget::Compound;

use Moose::Role;

sub render
{
   my ( $self, $result ) = @_;

   $result ||= $self->result;
   my $output = '';
   foreach my $subfield ( $self->sorted_fields ) {
      my $subresult = $result->field($subfield->name);
      next unless $subresult;
      $output .= $subfield->render($subresult);
   }
   return $output;
}

1;
