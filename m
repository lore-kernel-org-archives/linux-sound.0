From: <markoni@otenet.gr>
Date: Thu, 12 Nov 1998 18:23:04 +0000
Subject: Soundcard problem!
Message-Id: <marc-linux-sound-91089445817213@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi, 

I have a serious problem with my soundcard which persistently 
refuses to cooperate with my Linux system. The processor is a
PII on an ASUS P2B-DS motherboard. My kernel is brand new:
version 2.1.125, but it seems to work fine so far for anything 
else but sound. The sound card is a vibra16pnp (by Creative Labs).

Whenever I attempted to use sndconfig, for whichever setup I have chosen,
the result was anticipated: A problem appears with modprobe.

Furthermore, when I type: "modprobe sb.o" the answer is:

/lib/modules/2.1.125/misc/sb.o: too many values for dma (max 1)

Has anybody out there seen this attitude before?

I suspect the following details might be useful:

	IRQ = 5
	I/O range = 0220 - 0223, DMA = 05
	I/O range = 0224 - 022F, DMA = 01

I obtained these data using NT diagnostics, so I do cannot be 100% sure 
that one could rely on them. :-)
(Afterall, I have deleted Microsoft from my computer!)

When I use  "pnpdump -c -script=out", the file "out" contains the following
information:



	#!/bin/sh
	prefixes="/etc/pnp/config-scripts/isa /usr/share/pnp/config-scripts/isa"

	function pnp_isa_configure {
    		local i id dir found_it
    		i=0
    		while [ "${dev_ids[$i]}" != "" ] ; do
        		id="${dev_ids[$i]}"
			for dir in $prefixes ; do
				if [ -r $dir/$id ] ; then
					source $dir/$id
					return $?
	    			fi
			done
			i=`expr $i + 1`
    		done
	# Failed to find anything
	return 1
	}
	unset irq irq_flags dma dma_flags io_start io_len io_flags
	unset mem_start mem_len mem_flags dev_ids
	board_id=CTL0070
	dev_ids[0]=CTL0001
	irq[0]=5 ; irq_flags[0]=0x00
	dma[0]=1 ; dma_flags[0]=0x08
	dma[1]=5 ; dma_flags[1]=0x12
	io_start[0]=0x0220 ; io_len[0] ; io_flags[0]=0x01
	io_start[1]=0x0330 ; io_len[1]=2  ; io_flags[1]=0x01
	io_start[2]=0x0388 ; io_len[2]=4  ; io_flags[2]=0x01
	pnp_isa_configure
	
	unset irq irq_flags dma dma_flags io_start io_len io_flags
	unset mem_start mem_len mem_flags dev_ids
	board_id=CTL0070
	dev_ids[0]=CTL7001
	dev_ids[2]=PNPb02f
	io_start[0]=0x0200 ; io_len[0]=8  ; io_flags[0]=0x01
	pnp_isa_configure



Strangely enough, the file /etc/modules.conf contains:

	alias sound sb
	options -k sb io=0x220 irq=7 dma=3,5
	alias midi opl3
	options -k opl3 io=0x388

The technical values from these two files are not so consistent, are they? :-)

I will be very grateful for any hint which may help.
Thanks in advance, and sorry for the length of this mail.
--
___________________________________________________________
   ,-~~-.___.      _____      |
  / |  '     \    /     \     |  Dr. Nikolaos A. Margaritis
 (  )         0   |      \    |  Agias Marinis 40
  \_/-, ,----'    | UNIX  |   |  Larissa 41221
     ==         \______/    |  Hellas (Greece)
    /  \-'~;       __|_|__    |
   /  __/~|  ___  |       |   |  
 =(  _____| (___)_|_______|   |  email: markoni@otenet.gr
