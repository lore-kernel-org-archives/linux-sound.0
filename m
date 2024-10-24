Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE22A198826
	for <linux-sound@vger.kernel.org>; Thu, 24 Oct 2024 21:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729804599; cv=none; b=g3ndTenMmA6By3q0SVK+BPTYg3BPfqSZ2/+FOhVoUdWIOF+OlA/rNUkKukFbCnA72qFM9SJCVS4H5kEoUhP6Zgd9n5tft6h8af2ye1rPCziKTjJZwS2mM3ltyjmbZxkFqApso+kr3j32KCsXPrt/DM7UUmQVyAQawZLVf6Hdp9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729804599; c=relaxed/simple;
	bh=g+SwgSaC3IoDv90ih8CrsOyVRIQdBssfnwY4SNNKItg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rdGqnKD12DVGgvle+IN/GSPGjTxJ0+QYnIebJX8LYgqji2z3/GBIYR5ss6MDzMKv6Q9QjQwJHF3DPpzaxchE9l1tx/9V+Cmw2x7yNoluL/onxeJ3Ufj8JF24v2u2xR/mY/EoTJrHzf8etw/31bqOwDMcFJyKBgRLzTjgshRcgrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QVrEjDSr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QVrEjDSr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729804596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jON5EbNWQzPqVBZ3Ba6MEDulG3LZ0QTAo8NjpqmFmR0=;
	b=QVrEjDSrArvk13cjvboNzlIf5E6hHUcuZ14SLPBVoOmSGw0xB/u3lbXOziUV+3c4zcVRp+
	e0tKWL3iVkyDmBJ0LrrJbUXkR+k/53ZNYs+djHWtXEiaTA1hiRXIvlAvZqq6xZ7NeXtMgD
	e/96LdMZzlpCij4b5ptiUMRtItwasMk=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-502-pW0viUKRP9yagJDmP6bsaA-1; Thu,
 24 Oct 2024 17:16:32 -0400
X-MC-Unique: pW0viUKRP9yagJDmP6bsaA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BAFD819560AB;
	Thu, 24 Oct 2024 21:16:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.75])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3EC801956088;
	Thu, 24 Oct 2024 21:16:27 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ASoC: Intel: bytcr_rt5640: Add DMI quirk for Vexia Edu Atla 10 tablet
Date: Thu, 24 Oct 2024 23:16:15 +0200
Message-ID: <20241024211615.79518-2-hdegoede@redhat.com>
In-Reply-To: <20241024211615.79518-1-hdegoede@redhat.com>
References: <20241024211615.79518-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The Vexia Edu Atla 10 tablet mostly uses the BYTCR tablet defaults,
but as happens on more models it is using IN1 instead of IN3 for
its internal mic and JD_SRC_JD2_IN4N instead of JD_SRC_JD1_IN4P
for jack-detection.

Add a DMI quirk for this to fix the internal-mic and jack-detection.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 8dfd91cc3668..54f77f57ec8e 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1132,6 +1132,21 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_SSP0_AIF2 |
 					BYT_RT5640_MCLK_EN),
 	},
+	{	/* Vexia Edu Atla 10 tablet */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
+			/* Above strings are too generic, also match on BIOS date */
+			DMI_MATCH(DMI_BIOS_DATE, "08/25/2014"),
+		},
+		.driver_data = (void *)(BYT_RT5640_IN1_MAP |
+					BYT_RT5640_JD_SRC_JD2_IN4N |
+					BYT_RT5640_OVCD_TH_2000UA |
+					BYT_RT5640_OVCD_SF_0P75 |
+					BYT_RT5640_DIFF_MIC |
+					BYT_RT5640_SSP0_AIF2 |
+					BYT_RT5640_MCLK_EN),
+	},
 	{	/* Voyo Winpad A15 */
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
-- 
2.47.0

