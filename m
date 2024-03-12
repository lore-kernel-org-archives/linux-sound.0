Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891D5139577
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 18:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710268145; cv=none; b=NXkC/vYhyK5W6K8PNcElNTkN9Kkvtt6dbOcJM2bCnkFmoZtTU9sVxy96e3z6GeUVOIcG38kwd17Wat6Udi1TmeQR5i9YnWKxJAnBVb6H1YSrI3AHRqPrzWYBw0bPRP9z2DJNkXAo50uOa6KAlmveweghRU2sjHHOEX/+pWo7JWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710268145; c=relaxed/simple;
	bh=WllykmaF4pGB/VJqzIAL+gVfpScS1uaCsxOlj7c5vg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TQkSFwcGJkaDw8U2gfjiEqgb+VKgE4cM4sMysIJ4hDoYqmp0bsCHsg2CmWwUC8UDg0cTY1VRx7nTGN1c7CruU1cUfjGy+vJi6LvhemCBAmf/76KPwBB8RuuChOu6c9PFgx7AcsSB9mYFCtVbcOYaNP7eqe6l4kCRKi2YfS8hewo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=i4Fr7+9H; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="i4Fr7+9H"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 41D81604B628; Wed, 13 Mar 2024 04:58:52 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 41D81604B628
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1710268132; bh=fxM7CDb4XA48mbNKp3MDjP+o9TU2afP477wsRb9DfJw=;
	h=Date:From:To:Cc:Subject:From;
	b=i4Fr7+9H+3BurRa4SLhv85l4D9t9o1uONRbzk7KhCranjtDKYyI4rfViMp7Px8/tY
	 FDmzK+kuKBXVPa6VPi4+xSoYXxE8Jkg3XXSSOMdZuTltkwal571z6SLTGQJ90qb88c
	 cGV1IE//cizKmqdf6yQ8Kkh6VSNU7UH/48KHz86Qnxk453Qm3dgeH0EPylVUFIw9Oq
	 /uNHkhGQi3NjBd82dLlef5ByU6ec1O1zclSrJ+GXiCTwHmONJTeihqsYcAAuZpDtUs
	 CZddU0ESnoCcT43qXPddYKpF373WU9k49mhYOtnSwXSNAZTh0UnZtv3PiU/4CehT4Z
	 GVpKB7/WnN/rQ==
Date: Wed, 13 Mar 2024 04:58:52 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH 00/14] ALSA: scarlett2: Add support for Vocaster
Message-ID: <cover.1710264833.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

This patch series contains:

1-2: Fix to wait for an ACK from the device after sending a command,
before attempting to read the response. This didn't seem to be
necessary previously, but with 4th Gen devices it seems to help with a
rare issue where the device stops responding.

3: Support for reading flash segments from the device.

4-11: Preparation for Vocaster support.

12: Vocaster One and Two support.

13: Add autogain target controls for 4th Gen and Vocaster.

14: Add Bluetooth volume control for Vocaster Two.

Thanks,
Geoffrey.

Geoffrey D. Bennett (14):
  ALSA: scarlett2: Move initialisation code lower in the source
  ALSA: scarlett2: Implement handling of the ACK notification
  ALSA: scarlett2: Add support for reading from flash
  ALSA: scarlett2: Rename gen4_write_addr to param_buf_addr
  ALSA: scarlett2: Add pbuf field to struct scarlett2_config
  ALSA: scarlett2: Add support for config items with size = 32
  ALSA: scarlett2: Add additional input configuration parameters
  ALSA: scarlett2: Define the maximum preamp input gain per-config-set
  ALSA: scarlett2: Define autogain status texts per-config-set
  ALSA: scarlett2: Add input mute controls
  ALSA: scarlett2: Add DSP controls
  ALSA: scarlett2: Add support for Focusrite Vocaster One and Two
  ALSA: scarlett2: Add autogain target controls
  ALSA: scarlett2: Add Bluetooth volume control for Vocaster Two

 sound/usb/mixer_quirks.c    |    2 +
 sound/usb/mixer_scarlett2.c | 2757 ++++++++++++++++++++++++++++-------
 2 files changed, 2235 insertions(+), 524 deletions(-)

-- 
2.43.0

