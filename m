Received: from b232-12.smtp-out.ap-southeast-2.amazonses.com (b232-12.smtp-out.ap-southeast-2.amazonses.com [69.169.232.12])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD6C30DEB8;
	Sun,  5 Jul 2026 14:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.169.232.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783261670; cv=none; b=t/5I9A+5HUZgZ+ShbP3ssqoLBRyWBMgx+3EhgXJuo8XvDeyRyz+jQMLgGt2Vw0GfrelIFTVS462fOtoSKYrtsa4v91LnGwM0SaM4iWo8u+vSzudmwIqHPrY5F/MEFC3rypI4QkGDfZrDKXbiAPRHoRa6mfsMoWNCYo8ruC3LqHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783261670; c=relaxed/simple;
	bh=4kTtB+GZryMPis7oe9o+yNBoOYzzFrcH+3vetAQks3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=al5JqvNIz+/TZfojCD6HrnX4CM2MOI5ikRb9+OjMhRJUwZwKWEWJyLs41kpI9Gb/ODq3EspuI7dqr2VEoxkLqStL4nQcuxLzr0oc0AqyOozBXP4xybqIhxl609MD4HyRWRsk8+LwG5GbHqbS1Nw+rUvVTVKX/bUrzsMRdejMLyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=callumwong.com; spf=pass smtp.mailfrom=bounce.callumwong.com; dkim=pass (2048-bit key) header.d=callumwong.com header.i=@callumwong.com header.b=aBetkYPv; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=dMKRMDC+; arc=none smtp.client-ip=69.169.232.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=callumwong.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce.callumwong.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=callumwong.com header.i=@callumwong.com header.b="aBetkYPv";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="dMKRMDC+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=tm32yydslvviquw2x2q4ycbntmmm3paz; d=callumwong.com; t=1783261667;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=4kTtB+GZryMPis7oe9o+yNBoOYzzFrcH+3vetAQks3k=;
	b=aBetkYPvwFMi/FVDlPTKU5pBlieCic/Uof8M6bzpoWnxZIOtJMmYOwwHkm/05wDg
	i/h7mIIYvgxbNiqovvbzsCA0PcYToA1VHumiNUzEwF8ab22jaR2SqZndIndTwJQtqk3
	exp9zMHCxy+if9vaw7bCjQe1+5k8eV9jN/nvbfzoUUG/6eLX/SH7HNGHAVHqLPiUJqz
	cUN01q1gsXs76NE6tthORvDin3AYTMc/bQgNikKa1jozFsM9bw738kUeclc2GVrVctF
	O4aRwXhkn+ufGvZMWxekyZli2RN7Z9pp2znAZI2wFZEW3NJG9uCPzPPKUjI8EChE6na
	FTO1doG+YQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=ulrbq2zjesb42hdt6rpnifgor3epinsy; d=amazonses.com; t=1783261667;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=4kTtB+GZryMPis7oe9o+yNBoOYzzFrcH+3vetAQks3k=;
	b=dMKRMDC+Yxqar8sln1OB9+qBRyAyiRs18d+Spc5Z0RDPskdxc8tAEwhwFwHp2H9o
	+mFcfnVCKDQTkDsLSsMJzXyW+5fRstQsN/gIknNR5+A+mW8KKXx0Cla4SLopN7eAI9O
	q+ncWnvW+T4Jz3MqudsGgqTaWds7lhtLHjsd7IKs=
From: Callum Wong <mail@callumwong.com>
To: tiwai@suse.com, perex@perex.cz
Cc: linux-sound@vger.kernel.org, sbinding@opensource.cirrus.com, 
	patches@opensource.cirrus.com, rf@opensource.cirrus.com, 
	david.rhodes@cirrus.com, linux-kernel@vger.kernel.org, 
	Callum Wong <mail@callumwong.com>
Subject: [PATCH 0/2] ALSA: hda: fix HP OmniBook 7 Laptop 14-fr0xxx speaker volume and mute LEDs
Date: Sun, 5 Jul 2026 14:27:46 +0000
Message-ID: <0108019f32ad9dfb-ac2d3ace-aed9-401b-97d5-9d43f5b7e2db-000000@ap-southeast-2.amazonses.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.ap-southeast-2.Bo07if0thBjjxfhnG0PllidpkDb4AFgWjQ4XZlpgJDk=:AmazonSES
X-SES-Outgoing: 2026.07.05-69.169.232.12

The HP OmniBook 7 Laptop 14-fr0xxx (SSID 103c:8e3b) has a Realtek ALC245
codec and two CS35L41 amplifiers. The speakers work, but the CS35L41
amplifiers are not configured, so they play at a lower volume. The F6
speaker-mute and F9 mic-mute keyboard LEDs also don't work.

Patch 1 supplies the CS35L41 _DSD configuration so the amplifiers probe
and drive the speakers at full volume. Patch 2 switches the existing
8e3b quirk to a fixup that additionally enables the two mute LEDs.

Both patches were tested on the laptop.

Callum Wong (2):
  ALSA: hda: cs35l41: Support HP OmniBook 7 Laptop 14-fr0xxx
  ALSA: hda/realtek: Enable mute LEDs on HP OmniBook 7 Laptop 14-fr0xxx

 sound/hda/codecs/realtek/alc269.c                   | 9 ++++++++-
 sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 2 ++
 2 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.54.0

