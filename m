From: "Downing, Thomas" <Thomas.Downing@ipc.com>
Date: Tue, 16 Apr 2002 14:49:14 +0000
Subject: Compiling ALSA with 2.5.7
Message-Id: <marc-linux-sound-101896881001154@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I am unable to build ALSA for 2.5.7 either as a module or 
built in to kernel.

The problem is that ALSA code uses a function virt_to_bus( ).
This is #defined as virt_to_bus_not_defined_use_pci_map( ).
So there is an unresolved external.

The switch from virt_to_bus( ) to pci_map_*( ) is not obvious.

Am I missing something?  I think I must be.  So , is there
a kernel config option that needs to be set/unset, or is there
a patch I should get?

BTW I tried building 2.5.8, but that failed spectacularly in other
areas not related to ALSA...  Hmmmm, I've never had kernel build
problems before, I must be regressing!

thanks
td

