Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD271E3DF2
	for <linux-sound@vger.kernel.org>; Wed, 28 Jan 2026 17:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769622523; cv=none; b=jTX1d4dLXtOqEsaY2QAw1NwYB8t1U++qA4L1jE9hvJUWlBvK5/tJWgTXy/TAj8U1OqmabIUtev23frxyUH7X2F5uM6R6Oiup/28gNsHkNbtRhNpsOWOcw2AEl4S+Bnbb8Bl924YmlRPwVRsv2Oi6Q4nsO73xHN15Ox60uRe8lRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769622523; c=relaxed/simple;
	bh=HqI1k4+zqvEhpdkCemIXNHECXz7zLH1ogx6VMZmSYLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gteg6Ge9EHjsTZr+DxXIM+V+Tk4NHASU3hOcGXEwX8g15WTiUsc/vznHmNIrsQctsSLmPYrqxb8MYHfj/HdHKdhJaggbpx/xe8JhXjdy0iKXdFSUzlLo7JC1I7mloHK09ozgaI3BpqH695ICSl+fHpBipyKE0S5HiNybd3JKsbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RonYOPlE; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RonYOPlE"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-409470ad5bbso43273fac.0
        for <linux-sound@vger.kernel.org>; Wed, 28 Jan 2026 09:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769622520; x=1770227320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k3xEzEkluUrjAOEaCr+kR2isbV4mKMndumYa1efkEFs=;
        b=RonYOPlE9uYg4spcy8OfVJsWcOXXZSkPX0LXtP1Uuib3Y8cI2XZACuf/NukvSQRpee
         ssGfpBNrwPRRhp9YkddhVSj7ZZu+Yx6rR3Royz8mUD3PzwC5rT/SgSJmxlSM8adEjqE+
         sT8BdRsNqejvPdJdiOjXIZrxsVGVuIHR98Bk6Uhari9Bpvqj1lIDcyc23U+k/oBRMdNt
         cz/UbIMkY3mKIYl2SywccLUPkBxuOis/nh6uwSLVk6cT4jgQdrmY9RlEbjQOVv86voSR
         1Wc4kYwWGKceVca/cbCmoPeEritdVW8qsQnCilF09I3x6dLT0Z9LB5IYGe6LC2Up/MD/
         5E4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769622520; x=1770227320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3xEzEkluUrjAOEaCr+kR2isbV4mKMndumYa1efkEFs=;
        b=TA37sVpguSrCYwfJrzHDOR2e+ULaEl21NSnt8MtIGP7u59ouceKSyOczulm6APnZUQ
         Oj5LFcfTin/rYj0Xb2FW+ZDtRGz1Q6v7waKPZkAPb1jMSaOSOoHiTwi85ofuM/feV8EX
         4Kzjbhl9VeUN2uEFY3+o7JzY1SqPWJFbiFEqSyYXb2/NbSTRlSQCoK7/ocM32RzaZpPS
         zYNw9+Lje5/OS6XRqxZ7utYGf+GmbMqLDdRS6bUnHs6Wbne4yhhSyAgcmFOHNVvdKT4j
         qDsW8riinrDbouCGdy6n6hPNauPyFJAnr99FVxru2j1Ej+W68BhUuNLeiEwiZwuFPIXn
         jodA==
X-Gm-Message-State: AOJu0YzM7WRP2bAeqCFUN4ihQlZ6aIe9zvA2vm0fbzWAgRczDYjNcjXo
	GUUJBiQYdNwrg0k3dchIal8R7JGOVohfMTzPpoLkxETVCctN3e2EeE07+J5zmw==
X-Gm-Gg: AZuq6aIh8SScSg+RKBavNeUCPYy1CA55QNqFm+fx1k/0wvlMIft4CZaCI9ikEmRhwyG
	sOPzVjlLCX8ote39uHbBBaRtFEcOwLIliun1/fYgquPBQ8MN2g2NeZefqheg28osbCFzKBkCxUE
	WA38c+Wa/op+KyEnvk7m72cmPUZjWwlw190jPvZFw/v1MZy4ipey5c7rNxLOE39DvsNQjSjhRkM
	3npMM23hoMR5NCERgk/CH0muhNyJI+4pqjpv+9ppTsp/nc0RBGmS9qLY5fFGGTDCbhQOjADGrh0
	CzTgRznxv6ASNDljVd9V9lLIPHVPcGl5WCZqCuUw8dcW5oQsDXvWKHQHCrXEzKWEavjgf54w/d+
	k8BVgC6Hq398ffZ+OxszhOh6ovqINjJL9ZfykNSpyWcwptDqHeQ3ANEGvfQWrgl+bOH8oZp5x6t
	UYRHes8WeP0kK0UtzI6cw=
X-Received: by 2002:a05:6870:8649:b0:403:f8ca:3fb2 with SMTP id 586e51a60fabf-4093fce1a18mr3870975fac.17.1769622520430;
        Wed, 28 Jan 2026 09:48:40 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-409575b0a89sm2187647fac.20.2026.01.28.09.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 09:48:39 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	wangweidong.a@awinic.com,
	tiwai@suse.com,
	perex@perex.cz,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 0/3] Anbernic RG-DS AW87391 Speaker Amps
Date: Wed, 28 Jan 2026 11:46:05 -0600
Message-ID: <20260128174608.1498-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Anbernic RG-DS Speaker Amplifiers. The Anbernic
RG-DS uses two AW87391 ICs at 0x58 and 0x5B on i2c2. However, the
manufacturer did not provide a firmware file, only a sequence of
register writes to each device to enable and disable them.

Add support for this *specific* configuration in the AW87390 driver.
Since we are relying on a device specific sequence I am using a
device specific compatible string. This driver does not currently
support the aw87391 for any other device as I have none to test
with valid firmware. Attempts to create firmware with the AwinicSCPv4
have not been successful.

Changes since V1:
 - Correct an uninitalized ret value error identified by kernel test
   robot. [1]
   https://lore.kernel.org/oe-kbuild-all/202601240757.gYdQGsXp-lkp@intel.com/
 - Added devicetree binding for the Anbernic RG-DS. This is based on
   the following commit that has since been accepted. [2]

[1] https://lore.kernel.org/oe-kbuild-all/202601240757.gYdQGsXp-lkp@intel.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit?id=9e3f8ae040009f66367b2ba1081b7e313b39aeff

Chris Morgan (3):
  ASoC: dt-bindings: aw87390: Add Anbernic RG-DS Amplifier
  ASoC: codecs: aw87390: Add Anbernic RG-DS amp driver
  arm64: dts: rockchip: add Awinic aw87391 for Anbernic RG-DS

 .../bindings/sound/awinic,aw87390.yaml        |  34 +++-
 .../dts/rockchip/rk3568-anbernic-rg-ds.dts    |  44 ++++-
 sound/soc/codecs/aw87390.c                    | 175 +++++++++++++++++-
 sound/soc/codecs/aw87390.h                    |  86 +++++++++
 4 files changed, 322 insertions(+), 17 deletions(-)

-- 
2.43.0

