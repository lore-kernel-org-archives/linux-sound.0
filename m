From: Mike Wyer <mjw7@doc.ic.ac.uk>
Date: Thu, 01 Oct 1998 11:27:13 +0000
Subject: Re: Linux 2.0.36pre12 / Modular sound 2.0.36 test patch 1
Message-Id: <marc-linux-sound-90724130232279@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 28 Sep 1998, Stephane Bortzmeyer wrote:

>On Friday 25 September 1998, at 16 h 13, the keyboard of Mike Wyer 
><mjw7@doc.ic.ac.uk> wrote:
>
>> There is a slight problem with it though- make xconfig dies on the sound
>> section:
>> Error: Invalid command name "istring"
>
>It works here. tk 8.0. egcs 1.0.3.
>
Well bully for you! The only information of any importance would be the
kernel version ( 2.0.36p12 ) and the existence of "istring" in tkgen.c
Besides, if you were compiling 2.0.36 (which I doubt), you shouldn't be
using egcs anyway (on Alan's advice). In fact, having now found the
problem, there's no way you could have been trying to compile 2.0.36-

The proc istring is defined in scripts/header.tk which comes with 2.1.x,
but is _NOT_ in the patches alan published. Copying that file into the
2.0.36 tree gets rid of the error message, but I haven't yet been able
to test whether or not it works properly.

Cheers,
Mike
--
          ///   Mike Wyer : <m.wyer@ic.ac.uk>   \\\
         //\\___________________________________//\\
      "I want to die in my sleep like my grandfather....
 ...Not screaming and yelling like the passengers in his car."
