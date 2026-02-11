Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E961D5146
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 00:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770769388; cv=none; b=amu+4PnqY6bXGg1qQB9c24yX4KCTDjdJA2nm7k/qckw6M/V1MFODmNEVD7fCA+o8vUnoSM8wY9/RE+MTo810J3jwbuPM8vaZ5cCkehlVZYMarA57hPl49DBHxV81stLpb8tPagDr7QJqSHbiXloNImZO48WBhy0D01eyr+L6Yig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770769388; c=relaxed/simple;
	bh=AY7mHDThPaO2wkWNP8u3FoV/R8/7Z0b9INKm1OzjKSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pZEH1/LjKgXsaM9743NXH+nopCmf7OPqBB7nwX+JW7zSj5WcPkcKvikgxAZ2a8GhKLhDN+0rnTZ66avtA8awRvwZGnrlN+aR0daSr2cd+/c24LRk44FH0jXYpyfm80w9x7eXKj2bJ9K7uRbDM0niu/Ym7lxS0nj77XpaNDs2jrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dz+Wkjtw; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dz+Wkjtw"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b885e8c679bso651401666b.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 16:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770769385; x=1771374185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AY7mHDThPaO2wkWNP8u3FoV/R8/7Z0b9INKm1OzjKSM=;
        b=Dz+WkjtwVgnmJGNXKnpZKahwQSwY/NQTRb09Bz7vL66RS4d5BTLrIVPxJpB11aXemH
         5E4QfWhcc60PPSLF5zO2DMQ4alDsH+riG2ivmfxCrleCQZPwjqA1IhO0DxKCw3lNsWjk
         L/w0xL2SvBSubs1GE2Fg5rfjrE4HmSObHaE6zfBZLpjqZkW7z4rhYfiwxxXPbWmXJHjN
         g68LRrX/sJQuvKqvyuHeBXLcoikaaDJjj3qiLPFAwcAJ7n6hMQkPeojuXLWv7YXZgGLX
         reXH6PEUPeDt6uNQOWvIhLLhjREL1QlU/Ic5crU+6oZcIhS6FXRJ6hPwfcqxmcNTsAiF
         0m5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770769385; x=1771374185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AY7mHDThPaO2wkWNP8u3FoV/R8/7Z0b9INKm1OzjKSM=;
        b=QsxmVezJpKYp71t74FSSUYOsCcNy65OHWRU6WizyZRZWLc4c2BnyMByv2VH3ld4FYu
         5Ni0sGui36khOz9m5thjiK0u49INGesb8nh3lk8G5yyYC95WyI17bGUqFFk7ySloLpbo
         QSb6+qhWDnlEt4MoSsZE+fIYb+1fTUXWUX2Vra1+OW6jSi6vtjH0QRH7QW44Ag9WxcQG
         uB3x40rFHtCTVzsyueP8e211rOwIJc2KZsuAaaaPTHmV25er6ap8xVLa4ArLDNA74Vjo
         TtHLziTTI8Y73rWGbTMrag0P8cJ3fvsYSutxKuBDVSDtOTgq8nRwivIkZR4wMBLAkbz/
         /lHA==
X-Forwarded-Encrypted: i=1; AJvYcCXY6WfYHpPd6XIjDIWm1ecz3zsjU8LLkfuAJ1xc/LeVCeJBgncNYjB/Jj+B37uXcRP/uDu45JkSd0OASQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDVSvKcY3SSbCgwhGSfU6J3J0Z8WEyn1/XcKwewIINVeW3OItp
	eN/U2D9L7bA8Is4KCz0LmAGNJeNm29uZQ5PUsx30SPXQMz65aYbigtOG
X-Gm-Gg: AZuq6aLNshVHY6SqKfh2CSiat5VsAEIO/UoVjbEOiR+GWp02GDqaggBrrxzdUtbvWA0
	AKQ3qkd32Z0i5dlafKt0vfbptwI/PoLLY7MV4b9afaJMg2hzMmNfQsq9aK4nKNuYFDNN1k4iAc/
	6fZuQGF+ZliVayGGoiolTrQTedncw9YofQBad6/i+zxU+YxJwwHxLiun3QfrASYi8keXOWPR38j
	Zk3Xb3FPgCJJHqqBuHJcGin6PBY28Cqa2yXjjRIlVyc0/FoOL35fEzSprunVP36eLgsbLKH/Ras
	EMvfQGGTHA64U+T1oS7yeGFGeIYQbTLY/X0AelWtqxJC06e0szNNoUxpFR3zYAo+JfdpXrnLh4i
	93vOqs0yIdgOOubpxUiLujdcVJ6Y3ilQXsQFSKEbB4VbyzsAreexaXfZQH2puwgiqCyubWf/HG8
	lxl1mdxpxiZ4+c4A==
X-Received: by 2002:a17:907:d26:b0:b87:6af7:c186 with SMTP id a640c23a62f3a-b8f6ae85045mr56982266b.54.1770769385192;
        Tue, 10 Feb 2026 16:23:05 -0800 (PST)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ec1db0bsm9992866b.46.2026.02.10.16.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 16:23:04 -0800 (PST)
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>
Subject: ASoC rt5677: Prepare to support Lenovo Yoga Book tablets
Date: Wed, 11 Feb 2026 02:18:32 +0200
Message-ID: <20260211002255.4090440-1-jekhor@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two Intel Cherry Trail-based devices using the RT5677 as a sound
codec: Lenovo Yoga Book YB1-X90 (Android tablet) and YB1-X91 (Windows
tablet).

They both have the same hardware configuration, but the X90 doesn't have
correct ACPI table definitions for many peripherals, whereas the X91 does.

Devices missing in the ACPI are defined in the board-specific driver
platform/x86/x86-android-tablets. In the X91 tablet, an ACPI _CRS method
for the RT5677 contains GPIO configuration entries which were not
supported by the codec driver before.

To support such device definitions, some modifications are added to the
RT5677 code: ACPI, SPI, and I2C matching ids have been introduced,
as well as some GPIO-related magic.

