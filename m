From: Gerald Teschl <gerald.teschl@univie.ac.at>
Date: Tue, 04 Jun 2002 17:34:43 +0000
Subject: Re: [PATCH] opl3sa2 isapnp activation fix
Message-Id: <marc-linux-sound-102321213115763@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-102320707510070@msgid-missing>
In-Reply-To: <marc-linux-sound-102320707510070@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Zwane Mwaikambo wrote:

>On Tue, 4 Jun 2002, Zwane Mwaikambo wrote:
>
>  
>
>>>         if(dev->activate(dev) < 0) {
>>>-            printk(KERN_WARNING PFX "ISA PnP activate failed\n");
>>>-            opl3sa2_state[card].activated = 0;
>>>-            return -ENODEV;
>>>+            /*
>>>+             * isapnp.c disallows dma=0 but some opl3sa2 cards need it.
>>>+             * So we set dma by hand and try again
>>>+             */
>>>+            if (dma < 0 || dma > 7)
>>>+                dma= 0;
>>>+            if (dma2 < 0 || dma2 >7)
>>>+                dma2= 1;
>>>      
>>>
>>Oops, that won't work on isapnp since dma = dma2 = -1 at this stage, how 
>>about;
>>
>>if ((dma != -1) && (dma2 != -1)) frob();
>>
I don't get what you mean? I tested this, if I do "modprobe opl3sa2 
dma=1 dma2=3" it will activate
the card with dma 1,3 (according to /proc/isapnp). However, my card will 
not work with these values.

>>
>>you shouldn't hard set 0,1
>>
The idea is that I first try to activate the card without assigning 
fixed values to dma. If this works, then fine. If not,
use whatever the user wants for dma respectively take 0,1 as default 
value. If I do not choose default values, then it
will not work automatically unless the user specifies dma. But if the 
user has to specify values, this is not PnP
IMHO.

 From your previous message I figured that my patch is fine with you?

Gerald


