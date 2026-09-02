Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911B548986D
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 12:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352218; cv=none; b=i9Kmb0GEAGYESB4M/edq1Pd3coxgJyaFzTbkv+RmKr8mmNAXFNnEcnBIATRwcA0PnxHujftQ8spoMSgMKhsYhPfANN6IhTU1sQm6Cg+5W+XpTeiwKTm7QMygZEyaeCEPgLYOlPtn4n8dOqP4rA+84A82FOqpuKq9s2c3LYLt14A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352218; c=relaxed/simple;
	bh=GFpA75rZV2PlUyJl3Nf9VvN1LxwqkpXHxSS2KKq2Zgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iAKH4f7LaXtFJd60DgK4StmeovzqfVUZ6IKZtz3FaiwJrn6WmmsnmdL3CFXTIEaII62cFX3SFXrhyktxSg66vbuC+nuOXrgsv8Mqcc8J+bLteEav3HEKE1eN+hY8nvUBVZ83x9iHWFJG9034nRz8reuUIZ9YG4FkC2/teK1vDPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCyjsSvA; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCyjsSvA"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47de0093c42so1097327f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 05:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788352215; x=1788957015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xYhGoOWQOPsCFTYCtiD4blv+QvJT+32JjL57CVsslHs=;
        b=ZCyjsSvAFlO8IPLctKM5Qv6CczUKjtimbQKTKrrp1LMt0T8wnbKco67MAg/ZPQmQCX
         70gZP5DMkYuuY/h9kWhZN7W4aNCJxwFTbLO4AKm+r7fui0jROVeBjsKeXkWyZf9M4bqz
         7OuzX34sE3yatMGjFDoh0dfegysjStxNe39/EoZXAwKnKtEPIxn4hVM+YS3Xx9q0qGoi
         in1xkcVz7/8oSjP9G1p1AD3oSsHgfHR/514wMSuztMTXkvLapGEqHD/lNwI1m5t/DCab
         7Bcdpbm/dy2dexe1uIaMQlpbGaOPPFmHCsKXTFoDzyljJ0QwZ9T5xhcfcLEU12xQS50G
         EXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788352215; x=1788957015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xYhGoOWQOPsCFTYCtiD4blv+QvJT+32JjL57CVsslHs=;
        b=egA0dh3MtI2jMEIYIv8RU0DZdLTl788A/uQNjYXZyd8avCvNdwtz9MVwswWblZe/sR
         v9g74KM1DGs/NSSHurZlbAaS+0uMJarmfAVqSxx+Xi8/43LQ9VHDa+RCB9Z4c2sneFg3
         wFH6ZADLdRC1jxFKoilmDQqk97fvQTDLAXn5KxNUc66v+YcYmvsdKiUSkcHyjWd8RRWk
         QKwzzq6YkRz5sZm4UJ9bsycQ6Zzciyykx3vIaKEqUYZCkk0ZnDp8hV4rfDb896LODABp
         yv8XeoooVZG9ohBt5WlJtmN9MC/v4E//hot4qxDB4oGOVRNk/UYCY8l8TXtvwnQRRVQg
         fBaA==
X-Forwarded-Encrypted: i=1; AKwUvByqvNnAItPC+ScF/rTRdj3y2QWCpkacTgMo3KjicBVUPV8eXC1hUbWb4mAfQ7UepYIcDK8gj5PwP4XXPA==@vger.kernel.org
X-Gm-Message-State: AFuF++l/KiymBp6XzKAd/Mr3V+itFJy3nNuvleGsOEK+OgFLAj+MPsrc
	PtAxMXYfU6/dmRq28B+i2pzniU7PCpMi2yb6YmzIaZOp5oIv1AZq6MZo
X-Gm-Gg: AYBFou3KBQT6xZFyHQc9t7eRaXb547+uUyVT+6X6AHsy/+RPSFtP51475Bgl8C2X0DX
	2PDXlmsakNFbHDE7UAS4Yd8BZ/Y7eu4sIfeHzZyv9UfIoq5iZpIlqjm1afhcMG1/bO7NWQ9x+1F
	lNcqvMq5vrUyLeE1le8SYTPJnJyNMrWW14/Ynj7OH2kf/3G10Qm4vEwr98hbZjYwMX64QZffKVb
	OLyCuA7izNB6ulSVxTqKrYyod5SBn378/jWw6q2Cc2ozsCvqr6KIeYAyl/sbfQ9EhYFkkFRHsZ7
	L7IYSC0efXPB3QANx6SdimyYEo1SadFj9Cd1LQxH/GA4udKtX0gpcXofowCJ7NJELWcGa5ogNLl
	MrvIQr5nHz+v+bTuD757gpcqFtlfKwo/vgwbELFveM/hKDdEJA14mGOSmf4SrL5H30ueyZozWHX
	IMmDPr60J7sPytjjbkh06bHAxEK5e0LBV9yuIoNJ7WvKoSqZI9uvyZmANRJ+ed+u8bB3w7xYTpr
	hK5lEFN9lIC/0EstEISxkUYopJt7shD9PKyO8f7jKxPrAkEtx3ZAQ==
X-Received: by 2002:a05:6000:4014:b0:482:fb97:2ae0 with SMTP id ffacd0b85a97d-484913b85a0mr8236171f8f.14.1788352214492;
        Wed, 02 Sep 2026 05:30:14 -0700 (PDT)
Received: from 1Z10 ([78.211.18.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e7fddbsm5824276f8f.11.2026.09.02.05.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:30:14 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	jekhor@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/2] ASoC: Intel: cht: Add Yoga Book RT5677 machine entry
Date: Wed,  2 Sep 2026 14:30:07 +0200
Message-ID: <20260902123007.769820-3-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902123007.769820-1-mauriziocasciano7@gmail.com>
References: <20260902123007.769820-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91F/L exposes its RT5677 codec as ACPI device
10EC5677. Add a Cherry Trail machine-table entry that supplies the legacy
SST firmware and board names and the SOF topology name.

The Intel DSP configuration selects one firmware path at probe time. SST
loads intel/fw_sst_22a8.bin and uses the cht_rt5677 board name; SOF loads
sof-cht-rt5677.tplg through the standard firmware search path. The same
kernel and machine entry were boot-tested with both paths on a YB1-X91L.

The SOF topology sources are maintained and distributed separately by the
SOF project.

Assisted-by: Codex:gpt-5.6-sol sparse
Co-developed-by: Yauhen Kharuzhy <jekhor@gmail.com>
Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 sound/soc/intel/common/soc-acpi-intel-cht-match.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
index e4c3492a0c28..442ef30ffcc7 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
@@ -137,6 +137,14 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
 		.board = "cht-bsw",
 		.sof_tplg_filename = "sof-cht-rt5670.tplg",
 	},
+	{
+		/* Lenovo Yoga Book YB1-X91F/L */
+		.id = "10EC5677",
+		.drv_name = "cht-rt5677",
+		.fw_filename = "intel/fw_sst_22a8.bin",
+		.board = "cht_rt5677",
+		.sof_tplg_filename = "sof-cht-rt5677.tplg",
+	},
 	{
 		.comp_ids = &rt5645_comp_ids,
 		.drv_name = "cht-bsw-rt5645",
-- 
2.53.0

