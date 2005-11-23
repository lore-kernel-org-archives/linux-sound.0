From: Pavel Machek <pavel@suse.cz>
Date: Wed, 23 Nov 2005 22:58:14 +0000
Subject: Re: [Patch 0/6] Remove Deprecated PM Interface from Obsolete Sound Drivers
Message-Id: <20051123225814.GF24220@elf.ucw.cz>
List-Id: <linux-sound.vger.kernel.org>
References: <Pine.LNX.4.50.0511231114340.14446-100000@monsoon.he.net>
In-Reply-To: <Pine.LNX.4.50.0511231114340.14446-100000@monsoon.he.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Mochel <mochel@digitalimplant.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, linux-pm@lists.osdl.org, akpm@osdl.org

Hi!

> This is a series of 6 patches that remove the old, deprecated power
> management interface from a variety of old OSS drivers, most of them
> marked OBSOLETE and scheduled for removal in January 2006.

It may be nice to develop some macros/tricks to convert those into
platform devices quickly. This would actually have chance of not
breaking suspend/resume on affected drivers. (Not that it matters for
these).

								Pavel
-- 
Thanks, Sharp!
