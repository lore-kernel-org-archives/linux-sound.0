Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526464;
	b=jMmgV1j8E5Y99pBXdkGzSrU+ITDn49ZAdGlIkVK4XPJ9pdwMMMzZyXn9FkmW7H9I//fh
	 PjWiqYSmgI54FT4tm2E/O67qZ8oRW26cWgTrtWtttVBIUpDDQ0zUsKgFkLpMnuui3UgkR
	 pAt6TPnKBptpmpfQ/RYNUDZDSkwXqhU2latvlKSru9U7bQyezbhagDCeh2TjnlxQOf5Z/
	 MjadvRAZxOnjM4ozzLHCgAjzfbLn4AJ5DHTdIM0sGcfYG3dZG/9Ixac14z37gB9pyaaZV
	 mew3sScTx5wk+AaDYkeBcuslpaGPoev4Wk0KL74+BO/98CXH+UR6S9Y9A6kLUjAUUkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4dS73s0RNBwQWtJKgOmGopns0VxsPPRrDus6J8zeb6Q=;
	b=4AxyNviflzbkpfYpkZCHYquWlAua4loXloK1xvmove9SSgLGF8YvD4H94Lk2hDRh0rtW
	 KCGBAVOfmUW/GxkQSRRDtGW//3AWX0lMwtMRginqPwOlGa9Nt/Zh+od6cSP7NvNFehK0A
	 u7VfUwLI25RQdQ1cFFY8398E+NiuC50JvgK0ahpvTEDf0/OzN1saNpxhg+EXwrI2gjFtO
	 idNgkF9gxhhPXNG08IhcCNVD+DOrNY5/Ycwoinu0qmT/95am/x19qhdlVGLrkgeqhQ/S+
	 Qp70xHqalroUqTAeuB8UEpOmwYG6f2l9rfPfIuF5vJxYcSURSGkKFvuIFTJSlK/F2kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DLXp/EvN";
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC30606A332
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 13:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FC30606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DLXp/EvN
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so1877150a12.1
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 05:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795526463; x=1796131263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4dS73s0RNBwQWtJKgOmGopns0VxsPPRrDus6J8zeb6Q=;
        b=DLXp/EvNuPGuj2+h4sUiMmjZgjb4JJ4XKMfjlNl3Zvty6aMzCJID8AttAmR6UMs1at
         LarNW+D5s7o51wQ+9lOXA80jOXnp8FgwlgKFjClVTsXBYkFKybrhGGnbzpeDoKyiT7cx
         W/cYG7m3ziGLJbEJNmamp3oGSEc7BCQGS+NKHoN8jZVkLy2gNdwYoBn/RirsKkjd4/rd
         fDAFpEJyarnc+aEdc3tzFkb3iHCPaY/0TtSmIPDzVVUJDfPKz65JfPMzFHWRg9IA3QA5
         tnQ3xBZcA7kA+TrZ6yVFPJRXsrpSgrndZXs+RhO1Nnsac/0zvYihPJTqg3YLMWjsis5j
         BIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526463; x=1796131263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4dS73s0RNBwQWtJKgOmGopns0VxsPPRrDus6J8zeb6Q=;
        b=ENvQ6T3Ao1NjYW2JVkBpBlvWWhuaHpx1IYlxhRtXCJ5JQPCcUKcShRLay0UD0cFxsh
         9/Z4h/LsDA0KLECGhFT3b3TPFIqV9K2VCx3Knv7k7AvHf9TVGQWbkSwtoEKEiHDJPVqQ
         xQzjR6luTLla4RMTbn7tyjODU/oagZfh+PBlYQV+u9tJIudZWV/j0gfy7M9vub8RiaH9
         b1x7lGruiuN10JVvLtA10C+tG0+spDl41dd7PlcE7lAir1b2oEvhIFur0zgPueU90vfA
         kB3N6KqE6bu9NP1ZE9yNTocs6/J+gQl55zmb1tS9xM+eo43jfrK2YiAyiEy3bXHskf0Q
         F6Nw==
X-Forwarded-Encrypted: i=1; AL+hErEcUIfjYt6reTTSKQZgwY7XESSmM2ujHLU0MQBqitLyPmsznylD83Av+CuCaTz+829fpAhiV0w4Wzoy9w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/JhURjDgWpJgdM7mPWPsRHsbJrYpcomVN7SCLX078buJxCe8Ut
	JWxivN2WnL+xDVGMDKWWMmIok8ZRtevZlH8e6HzqifEdnL70CpCqju35
X-Gm-Gg: AZFdTZdt3RwZK0t9OtjIndKlA02qOpmgW45Uzcl24uReCQhWo5AMPC1cc3M5BnoWUkK
	Oha0sXt730Rd55/zUsfGG43uYpSWYDl6ZAwGmxAeJBCz69S+GwAKYHKNbjQwJEg/RDitpNmBLEh
	MB4kSTOfk75VhN3mqC0ZGqsUyN78AZnsz8EhskWmjoAXwQu2C+M+ePSXTeB4zUu5eWc47JiDi6N
	a3pl/Jq3KCO5rorY5Nh3LgQhPqUB1IR2/UY13xcu7oCYsVawsF6PRpyIUWSeYHVapFBH7D2UkZ1
	tkr3Xkfq6BRTouBXdOcA2mmw1Nu+Wsz5mdIz5IKCR0/CleQFCT0BQqZQ/8v6kSnwXvPLPJZ3kB0
	2dAnc6Kgj2ZYRuLrKz2tB5zW7ZlYJaSBVajhZ/C4OQfeif79hm8xJs2iyw8Tn1WuW3HFj0ZEqRv
	zxtDrx0n085i39hBwPmE9/pJyIo98B8LgvSIiTcarZVfD3tMC9OgLqrB4Oqx1fcolFkCV77GMw3
	9kGYM6bUxDYlpe9zp4YpCYpi0rCNbZEFSY6o2YBcRg2Y3zPIfKhu4J12JBhdWFxEpfEijhBz4Dv
	5fDgXUAy5w0TK4JviZF0W82KyswqWzYA95Bjv+NrNMSLoerBsGfkEA==
X-Received: by 2002:a17:90a:d2cf:b0:3b0:92b2:2e74 with SMTP id 98e67ed59e1d1-3b41c994355mr11715156a91.62.1795526463470;
        Tue, 24 Nov 2026 05:21:03 -0800 (PST)
Received: from fedora.tail41c118.ts.net ([2404:7c80:6c:6dfb:223f:1b1d:3633:124d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm12556863a91.9.2026.11.24.05.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:21:03 -0800 (PST)
From: Arshdeep Singh <chahalarsh342@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arshdeep Singh <chahalarsh342@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP Pavilion 15-cs3xxx
Date: Tue, 24 Nov 2026 18:50:56 +0530
Message-ID: <20261124132056.57345-1-chahalarsh342@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Pavilion 15-cs3006tx (ALC295, subsystem 103c:86e2) has no
working mute LED by default. Booting with model=hp-mute-led-mic3
makes the LED work on this machine, so add a quirk entry for this
SSID that applies the same fixup,
ALC269_FIXUP_HP_MUTE_LED_MIC3.

Testing: verified on the hardware with model=hp-mute-led-mic3, which
selects the same fixup as this entry. alc269.o builds and
checkpatch.pl --strict is clean. I have not booted a kernel built
with this patch.

Tooling: the working model option was found by manual testing,
guided by an AI chat assistant (Claude). The table entry and this
changelog were prepared with a coding agent (OpenAI Codex); I
reviewed both.

Signed-off-by: Arshdeep Singh <chahalarsh342@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f49021d01..2212e6027 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7837,6 +7837,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x86c1, "HP Laptop 15-da3001TU", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x86c7, "HP Envy AiO 32", ALC274_FIXUP_HP_ENVY_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x86c8, "HP Laptop 14s-dr1xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
+	SND_PCI_QUIRK(0x103c, 0x86e2, "HP Pavilion 15-cs3xxx", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x86e7, "HP Spectre x360 15-eb0xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
 	SND_PCI_QUIRK(0x103c, 0x863e, "HP Spectre x360 15-df1xxx", ALC285_FIXUP_HP_SPECTRE_X360_DF1),
 	SND_PCI_QUIRK(0x103c, 0x86e8, "HP Spectre x360 15-eb0xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
-- 
2.56.1

