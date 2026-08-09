Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAF63C7E0E;
	Sun,  9 Aug 2026 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786270584; cv=none; b=tCr0X802q8Az8VG6ODjpOaGa+ES8sS7FDjezkHd/IrhKp/Vgb/A0C4ZTFRzjEzUdZr3051/TTdan0zz3852HV81JtNf3b8K8IkMKjJA+XszCr5wFP4c6yRsj1R001AuNsecqbHVN+BcJnLuJ4tHIja9qzV95iwXaIyLaehcpI6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786270584; c=relaxed/simple;
	bh=xAvKIMSarrMteQnXUSTrrN4SGnb0sKQGx0wtYG5MyTA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S6GZhi+DWiLhynR+ZousWnRJ/nyQgJL5SpFztKxD1edR01+HENnBEYlAR66E8XUJ/I76293+365bAzBlc9QYBgFOVI6+GDiFHplwfx5Hv/MTZwrlJUuE7AlOsYKScUub8dHIvy3VQLJy5dwU4dD1tmdqn9gNmHGSfsYmWbCVTxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi; spf=pass smtp.mailfrom=saarinenkoti.fi; dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b=iGIjdfS/; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=saarinenkoti.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=saarinenkoti.fi header.i=@saarinenkoti.fi header.b="iGIjdfS/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=saarinenkoti.fi;
	s=protonmail3; t=1786270566; x=1786529766;
	bh=bLGBl5iyOkFHomVE5ec7XpLAZu5Q7qxrFW/yQFBlTkY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=iGIjdfS/S4OhzAQI0JOsvfWApCsC1O1sNKUqpKEnLeogSX/r3X75R6iUmni94NFfd
	 ltOBOILFwZFdtJDLFO8AZh0+GCQZeYCWWBicDBv3JUIZoVN5838mcHkDxNf0CObBms
	 LUPUBgH5ADm6+MD+Oe9WPWtNNywMVmLCaWh30ouoIM/R9vRHTyXU6DRxKQA/n/fF7w
	 7N40C/tLbutrE1Bh9dVv18Qrh3QcjBflOb6G8OHPGH+HXVJFVjfw03zvDOovjQZP9n
	 moyIETJk2paZokmrGSgj1KE/624uRLpRUCOi8peMkV9AYdBc1BhIi2XNy9Z4vu+W2O
	 pOnX6LD3NNQJQ==
Date: Sun, 09 Aug 2026 10:16:01 +0000
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>
From: Ville Saarinen <wiza@saarinenkoti.fi>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ASoC: tas2783: let regmap-sdw-mbq poll for deferred transactions
Message-ID: <20260809101541.4969-2-wiza@saarinenkoti.fi>
In-Reply-To: <20260809101541.4969-1-wiza@saarinenkoti.fi>
References: <20260809101541.4969-1-wiza@saarinenkoti.fi>
Feedback-ID: 137674609:user:proton
X-Pm-Message-ID: b57dfde39cfeb5c40499c7b9378a1af959f785e3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

In SDCA, a Function answering COMMAND_IGNORED to a Control write has
deferred the transaction rather than rejected it. regmap_sdw_mbq_write()
handles that by calling regmap_sdw_mbq_poll_busy(), which waits for the
Entity-0 Function Busy bit to clear and then retries once. Neither half
of that works for this codec:

 - poll_busy only polls if ->readable_reg() accepts the Entity-0 Function
   Status address. tas2783_readable_register() answers out of
   tas2783_sdca_mbq_size(), which has no case for that address, so the
   poll is skipped and the core falls through to a bare
   fsleep(cfg.timeout_us).

 - tas2783_mbq_cfg sets only .mbq_size, so timeout_us and retry_us are
   both 0. The fallback wait is fsleep(0) and the retry is therefore
   instantaneous.

Every deferred write consequently fails by construction, returning
-ENODATA and logging "Defer on undeferrable control".

Add the Function Status register to the mbq size table so the poll can
run, and to the volatile table so a later regcache_sync() never writes
back to a status register. Mark the UDMPU23 Cluster Index deferrable and
give the mbq cfg a poll interval and a deadline.

Note the two cfg fields reach read_poll_timeout() as (sleep_us,
timeout_us), i.e. .timeout_us is the poll interval and .retry_us the
overall deadline -- the reverse of the kerneldoc on struct
regmap_sdw_mbq_cfg. The values here follow the code, which is what runs.

Developed with AI assistance. The assistant traced the -ENODATA into
regmap_sdw_mbq_poll_busy() and drafted the fix.

All hardware measurements quoted above were run by the submitter on the
affected machine. The submitter has reviewed the change, understands it
and takes responsibility for it.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Ville Saarinen <wiza@saarinenkoti.fi>
---
 sound/soc/codecs/tas2783-sdw.c | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.=
c
index 3d0b11654..5a7ac6224 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -423,6 +423,13 @@ static int tas2783_sdca_mbq_size(struct device *dev, u=
32 reg)
 =09case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU23, 0x01, 0):
 =09case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU23, 0x01, 1):
 =09case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_OT25, 0x04, 0):
+=09/*
+=09 * Entity 0 Function Status. regmap_sdw_mbq_poll_busy() only polls the
+=09 * Function Busy bit if ->readable_reg() accepts this address; without
+=09 * it the core drops into a bare fsleep(cfg.timeout_us) and, with that
+=09 * left at 0, retries a deferred transaction instantly and fails.
+=09 */
+=09case SDW_SDCA_CTL(1, 0, SDCA_CTL_ENTITY_0_FUNCTION_STATUS, 0):
 =09=09return 1;
=20
 =09case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_IT26, 0x10, 0):
@@ -505,6 +512,8 @@ static bool tas2783_volatile_register(struct device *de=
v, u32 reg)
 =09case 0x400 ... 0x440: /* Data port 4. */
 =09case 0x500 ... 0x540: /* Data port 5. */
 =09case 0x800001:
+=09/* Function Status is a live status word; never let the cache hold it. =
*/
+=09case SDW_SDCA_CTL(1, 0, SDCA_CTL_ENTITY_0_FUNCTION_STATUS, 0):
 =09=09return true;
=20
 =09default:
@@ -525,8 +534,36 @@ static const struct regmap_config tas_regmap =3D {
 =09.use_single_write =3D true,
 };
=20
+/*
+ * The amp answers COMMAND_IGNORED (-ENODATA) to a UDMPU23 Cluster Index w=
rite,
+ * which in SDCA terms means the Function deferred the transaction. Declar=
ing it
+ * deferrable stops regmap-sdw-mbq warning about it and documents the inte=
nt;
+ * the poll-and-retry in regmap_sdw_mbq_write() runs either way.
+ */
+static bool tas2783_sdca_deferrable(struct device *dev, unsigned int reg)
+{
+=09switch (reg) {
+=09case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_UDMPU23,
+=09=09=09  TAS2783_SDCA_CTL_UDMPU_CLUSTER, 0):
+=09=09return true;
+
+=09default:
+=09=09return false;
+=09}
+}
+
 static const struct regmap_sdw_mbq_cfg tas2783_mbq_cfg =3D {
 =09.mbq_size =3D tas2783_sdca_mbq_size,
+=09.deferrable =3D tas2783_sdca_deferrable,
+=09/*
+=09 * NB: regmap_sdw_mbq_poll_busy() passes these to read_poll_timeout() a=
s
+=09 * (sleep_us, timeout_us) -- i.e. timeout_us is the poll interval and
+=09 * retry_us the overall deadline, the opposite of what the kerneldoc on
+=09 * struct regmap_sdw_mbq_cfg says. Values below follow the code, which
+=09 * is what actually runs (checked against mainline master too).
+=09 */
+=09.timeout_us =3D 1000,
+=09.retry_us =3D 100000,
 };
=20
 static s32 tas2783_digital_getvol(struct snd_kcontrol *kcontrol,
--=20
2.55.0


