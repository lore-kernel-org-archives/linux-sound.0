From: Chen-Li Tien <cltien@home.com>
Date: Mon, 05 Jun 2000 08:21:33 +0000
Subject: Re: C-Media 8x38 driver for kernel 2.4
Message-Id: <marc-linux-sound-96019357200034@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96019100230870@msgid-missing>
In-Reply-To: <marc-linux-sound-96019100230870@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Dear Paolo,

I also made a version that support kernel 2.2 and 2.4 (thanks for your
work), and fixes since the version 3.21. I read that you add S/PDIF in/out
in the init-module. May I remind you that they are not supported with all
format, so if you only use 44k/48k then it is ok. User would need to unload
and load the driver to use S/PDIF in/out and use another wave format. I
don't suggest add it as general driver come with kernel. It is also explain
in the cmpci file.

The version 4.02 driver can be got at
http://members.home.net/puresoft/cmedia.html.

Sincerely,
Charles Tien

Paolo Rossi wrote:

> Hi,
>
> During this weekend I've tested my patched driver on the following
> kernel versions:
> 2.3.99pre6
> 2.4.0-test1
> 2.4.0-test1-ac7
>
> It seems to work fine (module and resident). This driver is a patched
> version of 3.21 released by C-Media on May 23, 2000. I've also included
> the experimental S/PDIF in/out support by Jan Niehusman.
> Download the driver (+Config.in +patch-against-2.4.0-test1 +ver_linux)
> at http://web.tiscalinet.it/luvassu/cmpci/cmpci-20000604.tar.gz.
>
> Bye.
>
> -lupo
