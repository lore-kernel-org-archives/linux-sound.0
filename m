Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A44238D27
	for <linux-sound@vger.kernel.org>; Sat, 25 Apr 2026 21:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777151610; cv=none; b=WYLBCPkvcvVaPKPcp0PYwbPZLiL7lBjrmELw5qheq+D6YvU0ZFYhGCFkHFSrkPk2XDUbBUOcXNZb19X7P4Gm5IlyGNvACTOdEVz3HgD8AqtzJ3R6Lh5j6YRChIWI0ySxIoOmO8JUWTvfLny/gxL5TaCIvhsgrH+pm0Rke3+dKtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777151610; c=relaxed/simple;
	bh=D7ZUur7zg5hH4iBKP1ApE3s8N99quPjIKmKL2bxdBQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WoNWuYGbdDM+rcg9gUZAgEYC1AsEIuIIaowsBb6vcaq3fj+RLAOyahKnTTkjoxYgCDeQ+gWjjDlEdXtvzSOaJ1ixBtPoL5tMR+Q+IA218KnWX48q06luk4JhTJAt8GKK+bysEv+4V0kCLllAaeu6QeKxb/3v6gG4f+2a0PFYo6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=RETa8Cej; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="RETa8Cej"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 3ACDB67BDB1F; Sun, 26 Apr 2026 06:37:30 +0930 (ACST)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 3ACDB67BDB1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1777151250; bh=LKW7TNRU/fpf4pP5B30w0En+gMrDYOX5UuBCkqcd2fw=;
	h=Date:From:To:Cc:Subject:From;
	b=RETa8CejCMZtgs/06hE2br/2wyO3uM8qaZo/x0sKKuR59D7ZrgfMDOWihh0wkF8zY
	 QBQyfsVln7MntU7ZA4glO9+LCxb6z7JfsAyqeNMd7o+1yl9/tVArgn2hp8ybPV6zk9
	 sI/wsV3DbWDZ+lSoVmzm2LsicJXJ2hb8FySoa5aiWsTpdu23ZeSXcevecyWdtH9PT+
	 g+0jR/yz91039ruoml5fR08ETfe/0Jkj7eqE0M7EcTKOlja2z5Hvjm/XcIjRrSE4ZP
	 rABgCJPs+/kyFvlo8dDqovCciX1W14gpocMQttdPxL7vQo7tGWXKZb7WLEOt1Y4qwR
	 1uI34zbZQuokg==
Date: Sun, 26 Apr 2026 06:37:30 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 0/3] ALSA: scarlett2: Fix 2i2 Gen 4 direct monitor on
 firmware 2417
Message-ID: <ae0tEsi8dKm1akJd@m.b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

Firmware 2417 for the Scarlett 4th Gen 2i2 moved the direct monitor
gain parameters, breaking that control's functionality.

The driver already has per-device scarlett2_config_set tables
describing each parameter's offset, but only one table per device, so
there was no way to express "this offset changed at firmware version
N". This series adds that capability and uses it to fix the 2i2 Gen 4.

Patches
-------

1/3: Replace the device info's single config_set pointer with a
config_sets array of {from_firmware_version, config_set} entries, and
resolve the running config_set at probe time once the firmware version
has been read. Each device gets a single entry matching its previous
min_firmware_version (or 0), so this is a no-op preparation step.

2/3: Drop the now-redundant min_firmware_version field from
scarlett2_device_info; config_sets[0].from_firmware_version carries
the same meaning. No functional change.

3/3: Add a second 2i2 Gen 4 config_set with DIRECT_MONITOR_GAIN at the
new offset, gated on firmware >= 2417. All other offsets are
unchanged.

Patch 1 is a prerequisite for patch 3. Patch 2 isn't a strict
dependency, but it removes a now-redundant field, so patch 3's Cc:
stable trailer names both 1 and 2 as prereqs by subject (please
substitute SHAs at apply time). Patch 2 can be dropped from the stable
backport if you'd prefer.

Tested
------

Verified on a Scarlett 2i2 4th Gen by writing to Monitor 1 Mix A Input
01 and observing with usbmon:

- Firmware 2128, patched driver:   write targets offset 0x2A0
- Firmware 2417, patched driver:   write targets offset 0x2A4
- Firmware 2417, unpatched driver: write targets offset 0x2A0 (bug)

Regards,
Geoffrey

Geoffrey D. Bennett (3):
  ALSA: scarlett2: Allow selecting config_set by firmware version
  ALSA: scarlett2: Fold min_firmware_version into config_sets
  ALSA: scarlett2: Update offsets for 2i2 Gen 4 firmware 2417

 sound/usb/mixer_scarlett2.c | 222 ++++++++++++++++++++++++++++++------
 1 file changed, 188 insertions(+), 34 deletions(-)

-- 
2.53.0

