Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5B7DF68
	for <linux-sound@vger.kernel.org>; Sun, 24 Dec 2023 19:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="ZgUMQZMg"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 15964604B9CB; Mon, 25 Dec 2023 05:48:35 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 15964604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703445515; bh=QLLZyfnpe9U8bhEl35okB5639hIvl6fOvsNMUeOD5DY=;
	h=Date:From:To:Cc:Subject:From;
	b=ZgUMQZMgpf8bwAL1LIUPBv6/ZSq1t4FM1yj9KjBge5PBLZLmp+8hJJlHKSVeWoFiB
	 w9qTt0CQAgzIl3KZlIJAH9cU88zXhCAg3zUrPmtO+N2UczagP+Ls3DCOJotP6BreUC
	 3QFXU90UTh/+yDiyJ5RuyicrY8gzePZnF8XZOQ6Xj1/lP6cY9c+yXmtRP8u0hEwgYW
	 Dc7o3VnLAUmO+g6aPbHJKnSDkgx8NxtK4QUhpi62hpLiQuhSCqg7AOnj4fPDgmbYPk
	 2wyTVtPFhPfn7otWMvOtJwCcknvzO5w21Uggjd1nd1flzQl3t63FksMNBfToOElhZS
	 fsvIhSQuAwqkg==
Date: Mon, 25 Dec 2023 05:48:35 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 00/23] ALSA: scarlett2: Refactor in preparation for gen4
Message-ID: <cover.1703444932.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

This series is preparation for adding support for the Focusrite
Scarlett 4th Gen devices. It applies on top of the previous series
https://lore.kernel.org/linux-sound/cover.1703001053.git.g@b4.vu/
"ALSA: scarlett2: Firmware Upgrade and Error Handling Improvements".

There should be no notable functional changes in this series, just
refactoring/restructuring/renaming/reformatting.

Regards,
Geoffrey.

Geoffrey D. Bennett (23):
  ALSA: scarlett2: Simplify enums by removing explicit values
  ALSA: scarlett2: Infer has_msd_mode from config items
  ALSA: scarlett2: Infer standalone switch from config items
  ALSA: scarlett2: Check for phantom persistence config item
  ALSA: scarlett2: Check presence of mixer using mux_assignment
  ALSA: scarlett2: Add config set struct
  ALSA: scarlett2: Remove scarlett2_config_sets array
  ALSA: scarlett2: Add check for config_item presence
  ALSA: scarlett2: Refactor scarlett2_usb_set_config()
  ALSA: scarlett2: Refactor scarlett2_config_save()
  ALSA: scarlett2: Formatting fixes
  ALSA: scarlett2: Parameterise notifications
  ALSA: scarlett2: Change num_mux_* from int to u8
  ALSA: scarlett2: Refactor common port_count lookups
  ALSA: scarlett2: Remove struct scarlett2_usb_volume_status
  ALSA: scarlett2: Split dim_mute_update from vol_updated
  ALSA: scarlett2: Remove line_out_hw_vol device info entry
  ALSA: scarlett2: Allow for interfaces without per-channel volume
  ALSA: scarlett2: Add scarlett2_mixer_value_to_db()
  ALSA: scarlett2: Add #define for SCARLETT2_MIX_MAX
  ALSA: scarlett2: Rename db_scale_scarlett2_gain to volume
  ALSA: scarlett2: Split input_other into level/pad/air/phantom
  ALSA: scarlett2: Split direct_monitor out from monitor_other

 sound/usb/mixer_scarlett2.c | 1536 ++++++++++++++++++++---------------
 1 file changed, 879 insertions(+), 657 deletions(-)

-- 
2.43.0

