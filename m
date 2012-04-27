From: Christian Melki <christian.melki@ericsson.com>
Date: Fri, 27 Apr 2012 14:40:37 +0000
Subject: Bug report: USB-audio volume quirks broken.
Message-Id: <1346E68D3A5B2043907CF4BF466383411A07E0114F@ESESSCMS0353.eemea.ericsson.se>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi.

kernel 3.3.2@sound/usb/mixer.c.
The driver runs function volume_control_quirks(....) from get_min_max_with_quirks(....).
When the driver builds the feature set in build_feature_ctl it calls the quirk adjustment before setting the kctl->id.name.
BUG: All of the quirks do a strcmp against an empty string and no quirks are set.

Unfortunately I don't have time to fix & test. (Know to little about the sound drivers too).

Could anyone please confirm?

Regards,
Christian Melki
