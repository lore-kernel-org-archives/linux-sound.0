From: christian <crr@freemail.com.br>
Date: Mon, 17 May 1999 18:47:04 +0000
Subject: Dynamic module loading
Message-Id: <marc-linux-sound-92702382006840@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


I'm getting the (now-common) sound-slot-? and sound-service-?-? messages
in my /var/adm/messages. Is there a place where I can look up the
appropriate mappings? Is there a central repository where I can look up
the appropriate aliases for a soundblaster, tropez and etc? In what
sourcefile are the services and slots listed or kept in? None?

In a related note, I once saw a conf.modules model that had multiple
aliases - for example,

 block-major-8  sd_mod ppa

which is exactly what I'd desire - since I need both to be loaded. Does
this work now (2.2.9?) I'm sure it didn't in 2.2.2.

cr
