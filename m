Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C705E3033EB
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 00:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790296242; cv=none; b=gqDtj73DbD2lo+jjK+YLJXUZXxUSClTGsAfbE2Y7D0WQ3JYNWb6wozgIa+Vq0NeOHgw0EN/V7jvWSWdSP5p9Fzm90xvwOoRaRZcta3BtncO034pJ0DCB8AE2IbEEqQN6xKsangyqkgz6BU6fWNb01B5hpSC9CY73HBqFjZwKLZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790296242; c=relaxed/simple;
	bh=CvPIC2JM+dKqbCoDovUv5x2Gr6pbwd0JSckpKYb0jQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YDLMLVzR+z7puFgPKJE/JGxfMVejxN8DxOAwE2m7Fg+0Ay8ivKOmxRATpSsRr5NS9yJ8IqyFDXv6k0TOep/0MjUbB/YP6lfkHsDgn6+AUcoKKJjO/C40mbTpZZ7AvyXAZf0GW8V69c2vEb1gghV+xlT7KkeGPNQNq8L1q/jfedE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RP+/DM0O; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RP+/DM0O"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso2770785e9.3
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 17:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790296239; x=1790901039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c13af8RtL0FVbjY4/4zJyKrfrJUuMzJXKHCQJ/nPs4k=;
        b=RP+/DM0Oj4SfCrd+RrQPjWk82VRfqMbp1JE/qsnXparPOSDCCcOpBFdJOZ0W08JAdG
         Y6ben7HPT4SuNa9E/nF/EmDzQL+p9nb+vWmF56se2pmCHS0x9OoNdGR1TIoA5Q1NkSd4
         2cGtrxa8ZU/PVW18GRztjyP1lY2UIk6DADtHqa4nkOaB7/CYGRCnQcCKamj2rfoxRGLW
         Qtf30J6zPoZrXGsPLm+rdhqzvKVy6MwLNjIXyGxl2YY+R+ZIiAlp59Exsr7YgjDpoAxd
         +ZueWFYFcpJs0eKh/wvCO5gzcNO9wnUaW1mnbl0by5n7kcn+CsVhU7i78SRRDIjy6rOO
         QDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790296239; x=1790901039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c13af8RtL0FVbjY4/4zJyKrfrJUuMzJXKHCQJ/nPs4k=;
        b=o9Z9Z2uK1x2Qy7foyvVQlzjx35PrNknGrJLiVpnvyOpgUoLwqXJrTg8uT/4EkShkHI
         CcyBYzL74I40p3JQr52quAoc+zJDWWUinjKBS7iufeGOs05zll/YTb2cApNGPGdUr5oM
         tmX8akYi7OjozEmqhDjGwiqmtzKCJuZIWyU7JKV7UCgJV20QYpLWRmZfBSgY4ezF1HAm
         OCEbyL1R4sF1bvcKfFhQzhMxKnXOXYdQfuZKs7vOmZCOVGQOHXRBNkXy0fE7VjjgcXIm
         NIsHgTPEcUMhX5AMQhb3rhtZkytqMzKkdZacMwpOqOlC/U9veqsctri62zdZ2jvqpcrR
         6tTQ==
X-Forwarded-Encrypted: i=1; AKwUvByV9Wb+6T8WmBMzZOxgC8Ps8wmrPy/lLxMNZFZQgbXZAJYAwR0N+AVCPdzq/YukVTg1D0bbB7PHFFFODw==@vger.kernel.org
X-Gm-Message-State: AFuF++mOTsmjrtMUdc+dKUQxY4lsCHmHqeB8n/LP1bNYgLMl1Q7w2lJF
	CnDNawQOOi7fzni0D6S8ClnMgYmdh4pgBcEbbpVgm+eWm3/8xs3pt8Ez
X-Gm-Gg: AYBFou1UmoMY9XPxiQ6hwcuZi5PfL28G/uBRNXmNtLAeuCjj3SPcIC+bz9ZOTJnhcJ/
	wEqw+bPTEyOjH1tjh8cihI0P3xGqZNznSPh17ozNJQ6vJ1pmZSKPFVLkgjapFdEw+SGK1SYZ44L
	reo1S3OwYKYkgU+69yNbePJ8OPJxXqxQqj86bR2g6bujSNwt+Dq3GIuC1BN9p6FkoJgfefrSZkW
	piQq8eB+9EAnvjEyh87WiMbNgMmf3fSw9s7iXsgRIrufV7+WrLVrduC3To+2yKOKp+inmmqLoe7
	1Bpae+wuTzFq1eBC5ahIJpMgCGm7WlNPaSZRnDkAifKrYQJf70P2bJAgTdLZN9WFszjw6xsAlKr
	cEH3ICSD+EHzGkCWhZstEIHl4GDGsHCl6gIEC1r93G7eAQrlg6eRmowhKnknvRlJOTGiLz5UnlI
	70vt2EuEOLlBxMOqq4Ec34UlUlMWEKZVYDRc4mua6qM9Y7ee/WP4XL77zGWogQs7avCPn9YEApo
	VjMQv/I7zKGmVkM5GsI9OYAHKrcMg+7g6H+YjSoXDYO7oGtHMcOt6l/+LGVTo585CYU2oGVWF+v
	j8EnxF8nJeVmHHaRmC6ZvfV5ZH8=
X-Received: by 2002:a05:600c:8b4c:b0:49f:bd3c:bc16 with SMTP id 5b1f17b1804b1-49fe66f4c16mr67306185e9.17.1790296238974;
        Thu, 24 Sep 2026 17:30:38 -0700 (PDT)
Received: from 1Z10 (mob-176-245-31-160.net.vodafone.it. [176.245.31.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fedec53c4sm34900745e9.4.2026.09.24.17.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:30:38 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Yung-Chuan Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yauhen Kharuzhy <jekhor@gmail.com>,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v8 2/2] ASoC: Intel: cht: Add Yoga Book RT5677 machine entry
Date: Fri, 25 Sep 2026 02:30:30 +0200
Message-ID: <20260925003030.1077471-3-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925003030.1077471-1-mauriziocasciano7@gmail.com>
References: <20260925003030.1077471-1-mauriziocasciano7@gmail.com>
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

Assisted-by: LLM
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

