Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861D8395ACC
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 21:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786570168; cv=none; b=nwqmrvzXOAn0hOWFTCYbylvphiR0UPMm699N31hk4jCB4/+Tx9Hab0sNFhgjgwVU48u7qVRh0KnPK5KC62eVwqZze/9GtS0fQtyHhJKi184/QorRJahz6e4LBQMHYp1zrJxoH6k1a0QLD9f/oCpFYlSsU0/7ZAfqh/IdPCmybsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786570168; c=relaxed/simple;
	bh=6o9u6odSECXn/Sqpo3ZEcFEnm6JKjYPT6jApYic+w8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TSkjzwFgQhHAn0FBjqZq4v+sPVDOlQ8NNSDHJukR6CK3YgQTrxbTVzoFs+j753LWZ4YNbUfOP4hXAWZrnQBu1F4iAIh+KCnP3yYc7oRCdVIJm3IPGPEhlxFBqnkt3WK9k7Px/5VV0RwsiEKDKM6NtLP0mB9VeH5n7vX41DsHH40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4BskAfB; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4BskAfB"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b2a22c52c1so43861e87.3
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 14:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786570164; x=1787174964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=APNfoquVENaFKAsc+zGS7Ne6Uj+23RMfT8VAp0rzc7k=;
        b=H4BskAfBDaI2SQhKSF45k/3fMpWJmEgdSGoUOU2LJKAe2Z4Td+XFSAKytDeFxBBwCj
         7VA0ButLHxQfE5DohR1rILzHhDps6LIly/faftQrlPAemHdXsTQ2/BEs5IqKlzUucdpz
         VSC6VQbkVCnG+FhflYkJLHYbsDxhjPI9p+C68Xm4/DWiP+rUo3BVVZVyGaV5Ds6tr7GX
         qAoMm+Swh1N3AE9nWnpuSrvx0tbYVWG8tNNApl3uwtUdEbpVGimvenAJfTdo0wpsa+mj
         iHkyaxnvFkNzMK2qnccFiKC7HYKYpe/IG3YMxexd26BC7G0pjGarMRULS4piki1uDyHM
         rR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786570164; x=1787174964;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=APNfoquVENaFKAsc+zGS7Ne6Uj+23RMfT8VAp0rzc7k=;
        b=oTw3TX/ile0zRPuGVqTtpRfQ/u2+QSb0WAo65X4uKoBAWy2XfxkHI+G7d68ICPlD+l
         kjpzMJ/G9vHpJqG1oEFGscNQoNFgeAuKkRiJ93cuRvQA79p4L6VLBVQ1x5v8j8IjwxZW
         yY3bd7DCrudNh1qkCbxp66UMvacIICgdh88tLR6BM7xSPrEorI54biG/hypCK6osLz8q
         UO837dtKjq16cdv3Nxld0uIVVd7Gp6U1jSYIuPDXpd87fC9Wem47HyHZA1w7u9zC3PZj
         Z5Y2/gbApAokV+NU7hgBTWQ0U0OA3To/4GmtInM7pXFfYX5X+DG6jf7s11mxilBmAN4n
         aqUQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbZwXeqI/J36GL2Gd2+wSc7W6Kbp4JgFy26VPE91CxC5crKwy2f1rIqk9lJjK1Gs0cNqoMEETtw7bTlg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz/WbuAI9qBriki/yyxkrBU5alRtPr0jsu7YxWrFZZ8+3+Z1nX
	GiTnC/D232ORQr5mGHHRSZLuwQQC0Hefdv20tWG39AmYZ78sYcnzzc5R
X-Gm-Gg: AR+sD10G98qg0QcJqZLCyMIGLfmGbrCj7mhzcyJMYh3q8a8MWLOZ69KFaUpOY3rn0ZC
	+CfaiGNGColxCznbGEd5hNoSsMRocsKMefioi+uuSrTCfBE1yfiSND4cut7Umvpk7srrPJxDMSU
	GvL0BWyuhG3b6dp6NLtvHtfhzTnjBpIK/+jdnRkU2lG3zoD+Iv4HL6JXY0JevdxdqSpc7urCaaH
	h4gtsfApw9vRW9NxtC8qKNO4vLvmqVWMMSOa3QkQ3pDILfKfVhB1kCW3OE7AzoN3EFY2gu/vxMX
	jyxc5TU1tZTpn2clZKT+ycU+fiBD06ly9JqaU+A6rKuyS+9OSMSrn5Itp1NCKEae1L2FCrdHWj9
	YOIgmzNBWbghajX9w6sn3w7U7GadNkQyWl48wdy1yxGQQ6cXtsao5O59pc02XVeXtaRdAaiDEk8
	7dcJTwsrGyy/k3euQkczmjbLFPFtdjkcVxT8GANLqabuzsayWOhGuUVUQVSwGPZ6TUodmqEbLQC
	89wHNpdYHkDWfWcL0ogPVzhTAuSzJjt6g==
X-Received: by 2002:a05:6512:a457:b0:5ae:c926:fc18 with SMTP id 2adb3069b0e04-5b453f85043mr51373e87.38.1786570164213;
        Wed, 12 Aug 2026 14:29:24 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b453a66a74sm67893e87.71.2026.08.12.14.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 14:29:23 -0700 (PDT)
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Antoine Monnet <antoine@montane.tech>,
 Robin Everaars <robineveraars@pm.me>,
 Ville Saarinen <wiza@saarinenkoti.fi>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: tas2783-sdw: power the Function up before preparing the port
Date: Thu, 13 Aug 2026 00:28:10 +0300
Message-ID: <20260813001500.9218-1-andrey.golovko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A Data Port cannot complete channel preparation while the SDCA Function
is powered down: the peripheral raises the channel's bit in
DPn_PrepareStatus and never clears it.

tas_sdw_hw_params() takes care of that for a stream that is being set
up, and the retry loop there says so - "ensure power on so that port
prepare succeeds".  Port preparation, however, also happens on a stream
that is merely re-prepared, without hw_params() running again.  That is
what userspace does after a suspend in which the peripheral lost power:
snd_pcm_prepare() reaches .prepare and sdw_prepare_stream(), the port is
prepared afresh, but PDE23 is still at the PS3 reset default because
nothing wrote it since the device came back.

The result is silence with no error anywhere.  The codec sets
simple_ch_prep_sm, so sdw_prep_deprep_slave_port() skips the
NOT_PREPARED poll, and a port that never prepares is indistinguishable
from a healthy one.

Power the Function up in the PRE_PREP callback, immediately before the
PrepareCtrl write it already performs, so that preparation has what it
needs on every path that prepares a port.

Measured on an ASUS ProArt PX13 (AMD ACP7.0, two TAS2783): after s2idle
with ~100 s of S0i3 residency, DPn_PrepareStatus stays at the channel
mask and there is no audio; writing PDE23 PS0 and re-issuing the prepare
clears it within 1 ms and audio returns.

Signed-off-by: Andrey Golovko <andrey.golovko@gmail.com>
---
Measured on ASUS ProArt PX13 HN7306EAC (AMD ACP7.0, two TAS2783 at unique
0x8/0xB plus an rt721-sdca on link 1), on broonie/sound for-next.

Before, after an s2idle cycle in which the amplifiers really were powered
off, with no userspace workaround running:

  PDE23 req=0x3 act=0x3   DPn_PrepareStatus 0x1 / 0x2   no audio

With this patch, same machine, an 8 min 51 s cycle with 526 s of S0i3
residency:

  PDE23 req=0x0 act=0x0   DPn_PrepareStatus 0x0 / 0x0   audio works

Full analysis of the failure, including a reproduction that talks to the
peripheral directly and needs no ALSA at all, is in this thread:

  https://lore.kernel.org/all/20260812192500.7714-1-andrey.golovko@gmail.com/

There I suggested the fix might instead belong in the AMD ACP driver,
which advertises SNDRV_PCM_INFO_RESUME on its SoundWire DMA PCMs. I have
since tested that and it does not help, for a reason worth recording:
after resume userspace calls snd_pcm_prepare(), which reaches .prepare
and sdw_prepare_stream() but never hw_params() again -- ALSA only
requires hw_params() after hw_free(). The port is therefore re-prepared
correctly, the bank flips and PrepareCtrl is written, while the Function
is still at PS3. No PCM flag can change that; the power-up has to sit on
a callback that runs whenever a port is prepared.

 sound/soc/codecs/tas2783-sdw.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index c217da5fccdf..34689b9764c9 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -1259,6 +1259,7 @@ static int tas_port_prep(struct sdw_slave *slave, struct sdw_prepare_ch *prep_ch
 			 enum sdw_port_prep_ops pre_ops)
 {
 	struct device *dev = &slave->dev;
+	struct tas2783_prv *tas_dev = dev_get_drvdata(dev);
 	struct sdw_dpn_prop *dpn_prop;
 	u32 addr;
 	int ret;
@@ -1270,6 +1271,25 @@ static int tas_port_prep(struct sdw_slave *slave, struct sdw_prepare_ch *prep_ch
 	addr = SDW_DPN_PREPARECTRL(prep_ch->num);
 	switch (pre_ops) {
 	case SDW_OPS_PORT_PRE_PREP:
+		/*
+		 * The Function has to be powered before the port can complete
+		 * channel preparation.  hw_params() does that when a stream is
+		 * set up, but a stream that is only re-prepared - as userspace
+		 * does after the peripheral lost power in S0i3 - does not go
+		 * through hw_params() again, and the peripheral is back at its
+		 * PS3 reset default.  Power it up here, where it is needed.
+		 */
+		scoped_guard(mutex, &tas_dev->pde_lock)
+			ret = regmap_write(tas_dev->regmap,
+					   SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
+							TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
+					   TAS2783_SDCA_POW_STATE_ON);
+		if (ret) {
+			dev_err(dev, "power up failed for port %d, err=%d\n",
+				prep_ch->num, ret);
+			return ret;
+		}
+
 		ret = sdw_write_no_pm(slave, addr, prep_ch->ch_mask);
 		if (ret)
 			dev_err(dev, "prep failed for port %d, err=%d\n",

base-commit: 6f6fb37f9f9a8ae88faa1b5b1978e57381488502
-- 
2.53.0

