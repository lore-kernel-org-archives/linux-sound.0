Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800223;
	b=5gcDVIr+duFKGtYFyuVV7o03xTy4UZ0f8lYHpVgoJ57rzz5JsPPh/Jai8NIalBJv0PdA
	 YtDWSQVYmK7VLVGbNncbl+an6Nk0ntgBeSM0U5y4/3kToNdSFP4gs47s8qM7+GZoWStp9
	 rbzSGs0icluKvDJ2zYJkRO+gQGLGKAXV1sRxw0tztJc1sq3015PB2AIHpiplnO7ND4y8Q
	 CEvb/+6NstRqpJ9fH/XWtBlQhPN0TpXM5HU/I368n/90V0ytswdvE3rBjcevPHDioaMle
	 /R5wJ3/SmN0CRfHTCO6NYeI6+1DW36pF1NTSdTKJjmSlttWepKIaAKHU0D0TwPYt2PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qGJYREng6mP0a84Z/i9sYR/1pkROGCrxvOWyOcTMik4=;
	b=ZEd/mF500IpQywFkLPONoabRt/d6+YEfLZIWlqem+BXSPKxNtZBGrqV4XkTrGgetd6xT
	 B5tUo8ouxdwaISIS7FvTY8G06nlxoc0ebvufxNT3chpa2MCrbfF4lvzOVT2pnWBK3hqs0
	 CiQtNauej3zWP7+O1G7d3m7FT07PXVi0rBpSQaq2u8ThCcJu52IoUAsO6xXhCqfSOwZ3D
	 BaKHcFngbtsBY4jpxwIWgSZdkrQltO4Y9sst7kfKAhZUJQP7ImV9fy1Q+3AxiH6ElOiY8
	 t0273jq5HTYPUvSwkJ3LizrI+ue179HqKePIaDRjiuH6XL+KE+jhd8Nt+yvGlQS/xkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yKqQayPk;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE44B606A326
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 13:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE44B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yKqQayPk
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e20edd106so506379f8f.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 05:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800221; x=1794405021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGJYREng6mP0a84Z/i9sYR/1pkROGCrxvOWyOcTMik4=;
        b=yKqQayPkJUWw6J7hqazH+ozjYPN/i0P0GqigVVPrJAZRF4u+eyK095IDxuiUayrkRP
         yUk/QTlnEcXJTgCsLAdfjnsElyqiwTTIh/49tnKCOsRv979Kqih7xugL461Riubzg4ny
         RU1nM887SxNpjTWk1g/EsKYHJVgyeyRo+EK1BNdiHJZOSyI2WIJeiE65mJuXKHM2YkTe
         QDiiUxGSuAoArceeYBO5nJgyIe3JtjvtAFmyP09tHpZhHGHNFzDpsD6G82xvZDeCGuMO
         LKPBGXk2RJdnCAXLfZQvCOVh402qXIO5YvuRGa8yKcIg94Ieov59KJCGllMnlD7uya3r
         +P6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800221; x=1794405021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qGJYREng6mP0a84Z/i9sYR/1pkROGCrxvOWyOcTMik4=;
        b=GPMtYGyOI00Mn6/N6z7KT+s0DhHYSIOunXDDO8h+yzqk1M+gACT1GG8FLxtFpWAOPE
         Pps+/L0QrWM4qQ9OaddQE3pmhDhcpZjQHqwHEq1rSQI/kjPXCGmd2eVEVsc5HwjGkSo6
         vkaoccLTrOE4Txy/wha69FbGfIXnbTkH8op5wwYnNrAT9u08pmeAeBjF+qa8RudnSajX
         HKklX1Vw2TPTDpNI8GNuS6ly9MFB6LRQlf/A3+DeQcUNbiD5CPHL7oEWhod7InwE9IjO
         Q8Myt/+84Cq9XfbLBQ3Szp9Q8o4jBcHX2Pnfwj/qAGeJ8jNDppOqIG3M25E//MT3E9SJ
         cnhA==
X-Forwarded-Encrypted: i=1; AKwUvBzWiUDmIxxonLVR5ghs1M7nwapnchLHThuw5Ii6qwXicLilXxZc9fo7xrTxZinOeSJwZUT+s5MQASC6pA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Sokp9XP2gzGv0+Y+8Xhad8qjLSzgydlpkW2T0rjdiEoWfUzCl
	jSuwijP71xu9iVhkHdsPUlcj91v7z9sGNXki9rPJcY4L4FlIo03yee5i
X-Gm-Gg: AYBFou2sZh2X9LFb4/uuUOMdEinYAkWSfz4w7cMM1tww+FfP6E2/8ljgsLyq94hT6SE
	xi9gp/0apfENbSnyHAM1zv/p1aaAr+PV7v14asVLzav6SEUF//fHvL49oLIGVkziIjQMqCfLCMO
	QIX0zgbJfA2k0Uupzthf9TMq81Gsf4RG+XEg+pnXaiF/mzMFCviE5GMc+u2c9fhKVtWnDR6B036
	b4DAbcU1c6ZV47bhVZ0irVIYf+xe/GvY4A1An760R/TMCTzEkYBdMbPgt6YOuI7jU9wr9nqKDly
	laNmnoGlXpOaPXLNvcGsKNOSX/d6b7SLHMnDrhvLC9+RPZFizRZEgWoa6OYOBWoVTbye68hkWcf
	H00K3WM22BlilDea7SpzNa+9e1Nr6l5okf97jT98yA2JY3zddm79tcUl2nxM4NQzpua/MVg6Jrj
	xuiczkeakZ8231Mt9HlM/MMkCzvhLiUIsTWpev68sKuPLDcFlHVAdIVjL8sU4SYv6tY8uN/WkTO
	GyUk+489Uxm7iwFJn8zHd6FeSeDTnMdnK6ferHddGDEOgwGsPhWcEERiuVmI518V6hQ14RarNKQ
	9xKYqxPU9dRPLzndn95vrmBKOoeWtJPsibn+UGIh0LqOTCrc/zmkldxczH7sPQJDPgT1ogKI6cn
	T1g==
X-Received: by 2002:a05:6000:184b:b0:48d:deaa:4dbb with SMTP id ffacd0b85a97d-48e6e2fc210mr35662505f8f.40.1793800220819;
        Wed, 04 Nov 2026 05:50:20 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feeb5196esm3701024f8f.58.2026.11.04.05.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:50:19 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: chancel.liu@nxp.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 3/3] ASoC: fsl_xcvr: select BITREVERSE
Date: Wed,  4 Nov 2026 14:50:00 +0100
Message-ID: <20261104135000.3723017-4-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104135000.3723017-1-jude.gyimah87@gmail.com>
References: <20261104135000.3723017-1-jude.gyimah87@gmail.com>
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

SND_SOC_FSL_SPDIF, a few stanzas up in the same file, already selects
BITREVERSE for the same reason.  SND_SOC_FSL_XCVR is missing it.

fsl_xcvr calls byte_rev_table, which lib/bitrev.c provides under
BITREVERSE.

  fsl_xcvr.c:(.text+0x1634): undefined reference to `byte_rev_table'

The driver can be built into vmlinux while GENERIC_BITREVERSE is a module,
in which case the symbol is not there at link time.

Select rather than depend on: BITREVERSE has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_SOC_FSL_XCVR unselectable.

BITREVERSE is the symbol to select rather than GENERIC_BITREVERSE: it
selects GENERIC_BITREVERSE only where the architecture has no native
implementation, so this stays correct on the architectures that do.

Reproduced on v7.3, x86_64, with CONFIG_SND_SOC_FSL_XCVR=y and
CONFIG_GENERIC_BITREVERSE=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 28564486866f ("ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/fsl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 2f58a1a51afd..21b0509da76d 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -104,6 +104,7 @@ config SND_SOC_FSL_EASRC
 
 config SND_SOC_FSL_XCVR
 	tristate "NXP Audio Transceiver (XCVR) module support"
+	select BITREVERSE
 	select REGMAP_MMIO
 	select SND_SOC_IMX_PCM_DMA if SND_IMX_SOC != n
 	select SND_SOC_GENERIC_DMAENGINE_PCM
-- 
2.43.0

