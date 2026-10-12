Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C433E46D54C
	for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 11:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806056; cv=none; b=Ntf50C6pzvRJLsXC3S40rSxX3oQMgnEqZwIfTRCeogMFx5wy89mn9BdxCV1tY4MnANYqOSlC0Tgr8HJ+VZyLyxQJZoce+h7okpzTTbxXGg/V+xGM9BPZiSFe3t9ZyoAuDzV+djes6EWVYroAt7PEKkKd9+hMQhqTXTmy3aT/7pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806056; c=relaxed/simple;
	bh=RIXnkaIGdBYruZ6AHlMRU+fZ6F/Tbfygc1Wr4yD/oEA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ZZhuWo+DzBY6aS3BhgQTCGqszJxGMjPUvP4lpY6kt9m2MuKAZKsYeUfM2kxE6l4PBE9bNvJ6MKZgFT1XbBUkG4HVUBkNU1intPDZ96nKJNjxjmf2Bc1/b6mLR9R99CmOMOZ7YjU54+Js5Ln+CA2TcNe9Vq7In+EcH3fd80stu1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvzqoBAf; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvzqoBAf"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so18654605e9.1
        for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 04:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791806053; x=1792410853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aHowWq+YczhDXXIY9TBMKGYh7uMuFbwbJnMWhOB2Lqo=;
        b=lvzqoBAfkt17Y3Gv8MkXfYnL6kJH4SAb8HxV11uXnzUf5S8CiXDQRfe//k+aUsvKW4
         HUIid88JWRbQMz0hs0FYxWggmHRXmAjRMqOh92rXALOxBUYluXp5WhLcxnar02Y/g24m
         IU2X0cwhBt6ieZzWwbHmXDosrprn3yXjyD+NOQ3ICcQ7lnMTXAPHEsfXwDBiSInQSyYH
         vTDkUCFjnumwOXX9vwieCXwZ6DkTq6Hzoa8b9X4icYJlz8dmLeQYzwleiIawQtViRopU
         xHxhcbj0i3esqKQMBZW4oLFPFgl6P5vximmbDde7TAv/hnPSigUXhenFq2QNLAwkJqpS
         cQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806053; x=1792410853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aHowWq+YczhDXXIY9TBMKGYh7uMuFbwbJnMWhOB2Lqo=;
        b=vJoQ9Or39pRM1NQul57yvN3PWglbBUQ2kFNTZu6RxykuMp7ujCrZg3FKWHys9ItkP4
         31SDW1Ve1WAsjwzhWFy8589i0qvpaMLBndiVt28Gv3roIgN7sVKrXpD9etVDdzOTfSv+
         dvhTOznC7CVDpxltBtCX1hlXaAY8EsT1BVhCLGBQR5+Ko5AJpdxn6H1gxfRG4J9qhozJ
         CpQ1kZuLCJW3NQp3z1v4LCGjuJdcsg40RjktxCqu4qhG4kaVrdDbzxXE8ihvwXYmC5au
         Mkx0XM+9nDny5E9CskVDuabpmXmlguY3mmExEOcKQS3yavE3/Z4ubZUDQ2CL8jR98cIN
         +MaA==
X-Forwarded-Encrypted: i=1; AKwUvByttpgigFRyyNWx33t9DLNfYcw71oQvx0QCsuejQ3Jpfx2KLNbBcI/3yOXEH02ffFjUO6Wn6+SVxmlq/A==@vger.kernel.org
X-Gm-Message-State: AFq9FYK87zrhO6m5lzdkdqnWHXWSRQkE755JpZXPGDP4tYXJNnfcTE2n
	L61JQCVEwTCKT70QV8YOmngXPDUvbFZCQlpdnMNLvEQxYnZWGnfO0zQu
X-Gm-Gg: AYBFou3wiePDmO2oRKRuC8R7Y5XzetREPmAhN1ql6Uk7fR29id9UycYvJUujqGzsPUW
	jRgOQQ9Sl7H3q5Hs+KjwZzVGZkU1cmIsfSNdMNyHhL6TuJhNQJzaxhyE40BettCHAtM3wm7aM/0
	wzWEjlJrO+tq8H6b1Q5y3gwgcn4+Idzk0lPY26gY+hg2HgGQYOUCyHg1axI0gUuKpJGUvil6iJR
	lFD3ZGwQSHJ3+D/ElyT5VTr5+3PJ8kp/H1EqJfOM7PLb0BiT9Q7Z2j980DCVbSh/t3uFK7zAebV
	cfPmcNjfQwNIxf7D1+V5Su44za0feM4Scc4IihZMfxFZEq9zhUBEVwIj710twDHxDDsp9o4hw6+
	y47TwHCW18Oap4yNRH2HZd2iOw9XPtKqSfDsrdotQW26LEOL5h1cKNiyqBXsjiEdI6QJnQqVCYb
	Ucv7vk62GxNL+9g/R5005OnGbY/1dDpII1Zkvh0juyIwsXtpWZiaYIa48yr9Tk9xBnhpTNpotxz
	ddNYGYlQ0RTJoJGTHszragI0nyT5Wa9Q+1vkXwGzL8bHwVT0x3pEQ/ghj6/5eg+sfSK20Ftblo0
	aLAuAIA7lkJ/PUilm7bRkg==
X-Received: by 2002:a05:600c:a404:b0:4a1:9945:98a7 with SMTP id 5b1f17b1804b1-4a1994598ddmr70360335e9.0.1791806052577;
        Mon, 12 Oct 2026 04:54:12 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2caf4sm311783805e9.10.2026.10.12.04.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:54:12 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] ASoC: Add support for AN7581 PCM driver
Date: Mon, 12 Oct 2026 13:54:05 +0200
Message-ID: <20261012115408.87066-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
supporting playback and capture at sample rates of 8 kHz and 16 kHz.
The driver configures the PCM bit clock to 2.048 MHz and supports
8-bit and 16-bit samples, with up to 32 channels.

Add YAML and driver. This has been verified with loopback
and confirmed by Airoha with ZSI voice chip.

Changes v4:
- Add review by tag for DT patch
- Address shashiko bot comments
- Better protext tx pos
- Set DMA mask for coherent DMA
- Use more managed resource
- Increase users in startup

Changes v3:
- Out of RFC
- Add Documentation patch
- Drop SLIC testing code
- Add MAINTAINERS entry
- Follow normal pattern for commit title
- Improve commit description

Changes v2:
- Rentirely rework IRQ handling
- Fix problem for timeslow configuration
- Better support duplex mode
- Better handle descriptor tracking
- Move to Soc directory
- General code fixup and cleanup

Christian Marangi (2):
  ASoC: dt-bindings: airoha: Add AN7581 PCM controller
  ASoC: airoha: Add support for AN7581 PCM driver

 .../bindings/sound/airoha,an7581-pcm.yaml     |  52 +
 MAINTAINERS                                   |   7 +
 sound/soc/Kconfig                             |   1 +
 sound/soc/Makefile                            |   1 +
 sound/soc/airoha/Kconfig                      |  10 +
 sound/soc/airoha/Makefile                     |   3 +
 sound/soc/airoha/an7581-pcm.c                 | 904 ++++++++++++++++++
 7 files changed, 978 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
 create mode 100644 sound/soc/airoha/Kconfig
 create mode 100644 sound/soc/airoha/Makefile
 create mode 100644 sound/soc/airoha/an7581-pcm.c

-- 
2.55.0

