From: David Luyer <luyer@ucs.uwa.edu.au>
Date: Mon, 14 Jun 1999 00:29:14 +0000
Subject: Re: Module vs INTO KERNEL ?
Message-Id: <marc-linux-sound-92931923926223@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92911616207004@msgid-missing>
In-Reply-To: <marc-linux-sound-92911616207004@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> Sound is best left as a module.  There is no reason to include it and it will
> likely help make your kernel too large to compile.  Modules are your friend.

They might be your friend, but they're not mine :P  There are many reasons 
people might not want to use modules, see many other threads here.  And 
modules actually take more RAM than building into the kernel if you actually
use them, as well as increasing security issues and having some cost in terms
of TLBs, etc.

Non-modular kernels are your friends.

As to the first question, I'll send the person a copy of my non-modular OPL3SA2
patch.

David.
