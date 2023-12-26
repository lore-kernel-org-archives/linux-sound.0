Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D44350240
	for <linux-sound@vger.kernel.org>; Tue, 26 Dec 2023 18:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="BFCAP8UW"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 33857604B90E; Wed, 27 Dec 2023 04:35:43 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 33857604B90E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703613943; bh=CON57+of8TBOPICOFKCi1R7VCFTAh8HOpoD/14du3LA=;
	h=Date:From:To:Cc:Subject:From;
	b=BFCAP8UWN+rZTWxjK2KGyi2g/Wa0hHSNjN+Ff47gEHW4Te3ug6lAHNF/QU8Qo3RP2
	 RLRPGn5J9QTQV7PUSGpScdqn6Me0ulwwV4wKBG1ReEOwwIk0qYFjWdUQCtY7o3oRDv
	 Xcg6zrrVRQ6sjDF4MaIDJD5sLqR/ox9peaEI8O2v70ty81BGoI99a9ojyK7xpIMeCh
	 3h6EWtdOGSfnv6XC8qO34VTcO/Eh9UgljQo3rVCZDVktAP92guu4ubi3pzVtqhLvOe
	 LtPoOd0zTPtl/9JrvJcd7wpgK2lFjR+sSJ3JOXUrTdYtFNPTyrLq9NSJsQu69KMa9V
	 CAWbl55+44LAQ==
Date: Wed, 27 Dec 2023 04:35:43 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 00/20] ALSA: scarlett2: Add support for Scarlett 4th Gen
Message-ID: <cover.1703612638.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

This patch series adds support for the Focusrite Scarlett 4th Gen
interfaces. It builds on top of the two previous patch series I sent:

- https://lore.kernel.org/linux-sound/cover.1703001053.git.g@b4.vu/
  ("ALSA: scarlett2: Firmware Upgrade and Error Handling Improvements")

- https://lore.kernel.org/linux-sound/cover.1703444932.git.g@b4.vu/
  ("ALSA: scarlett2: Refactor in preparation for gen4")

I already sent patch #1 in this series below separately:
https://lore.kernel.org/linux-sound/ZYsBIE3DSKdi4YC%2F@m.b4.vu/
as it should go in to 6.7. I wasn't sure if I should include it again
here or not; sorry if I guessed wrong.

Patch #2 is a little cleanup I missed before sending the previous
series and would have gone there had I noticed.

Patches #3-18 add the new controls, etc. needed for the Gen 4 support.

Patch #19 adds the USB IDs and configuration data to enable support
for the new interfaces.

Patch #20 adds a last-minute new control that is only present on the
Solo Gen 4.

Regards,
Geoffrey.

Geoffrey D. Bennett (20):
  ALSA: scarlett2: Convert meter levels from little-endian
  ALSA: scarlett2: Remove repeated elem->head.mixer references
  ALSA: scarlett2: Add support for air/phantom control on input 2
  ALSA: scarlett2: Add support for Gen 4 style parameters
  ALSA: scarlett2: Allow for controls with a "mute mode"
  ALSA: scarlett2: Add support for Air Presence + Drive option
  ALSA: scarlett2: Add support for software-controllable input gain
  ALSA: scarlett2: Minor refactor MSD mode check
  ALSA: scarlett2: Disable input controls while autogain is running
  ALSA: scarlett2: Disable autogain during phantom power state change
  ALSA: scarlett2: Add power status control
  ALSA: scarlett2: Store mix_ctls for Gen 4 Direct Monitor
  ALSA: scarlett2: Handle Gen 4 Direct Monitor mix updates
  ALSA: scarlett2: Add support for custom Gen 4 Direct Monitor mixes
  ALSA: scarlett2: Add support for DSP mux channels
  ALSA: scarlett2: Rename DSP mux channels
  ALSA: scarlett2: Add minimum firmware version check
  ALSA: scarlett2: Add R/O headphone volume control
  ALSA: scarlett2: Add support for Solo, 2i2, and 4i4 Gen 4
  ALSA: scarlett2: Add PCM Input Switch for Solo Gen 4

 include/uapi/sound/scarlett2.h |    4 +-
 sound/usb/mixer_quirks.c       |    3 +
 sound/usb/mixer_scarlett2.c    | 2339 +++++++++++++++++++++++++++++++-
 3 files changed, 2279 insertions(+), 67 deletions(-)

-- 
2.43.0

