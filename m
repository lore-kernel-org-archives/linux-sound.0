Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509312;
	b=v4sCIH4oYttF7WElkSx4JpdMZC+xp8J4d3PFJRhaSZI6EQS+dfANahI+l0Y6Z8w0ZtYM
	 eGBZWxaG9HGkhLdK9J8VvSLsRaPe2tNIzsTaMe0p4h6GbZuQ9TLy8IznbAiMUz5IAToD1
	 FzsI9Z33eUGnpTxFIrSOyHFmx6sl++c43DpUok8ORMkZuGF3yUcCaJWUEAbSK0J9lzfde
	 ksyqRUxXcYSZiQCJkQTdivwn+EgxoAo7X3KSTYHdVMDG+uHwMKdtspe+PjflN9MEiqgca
	 GSwS+qfe5oO1lq/SxkLrhEUewBAWSGPffDCDVaFj58Gp6EP32quoRx5QDNyNOEVtbbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DID619nHoGzpMole3aPvhf29bKJwz2HOUU8J+9wx+Hw=;
	b=W4n2i8cZ0XaV5811uXoVhbU0dSdGUunZxdIQmU3JyrLtGCEYTUvcr6VXHnYkEhfgY3iM
	 nb0gKFedP87NM5Z8sBs35PPXD1VDRNUxQach29jBSiihZ5Htot0aiD8MKW2oS29/i4H1Y
	 V/uYvioguPlEUZ7GJZIV7OCfIL4HXlxDWq90Sj2coT07WQZrUO/T/CBhaoKKKP2i+PWGs
	 GPnj0r/QATjXbTCRN76usbdUMr6B98c0erl7Nc8N8SyNkjQvRQ1vNj8k2LEqt1YVHL3qf
	 w0C7I4hARdy1H190a0azMEwOSSbH/6hRW8/BFauT1t705azVf6sP6JikSaxMU4XbcUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eQSNMzCo;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21819606A320
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 15:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21819606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eQSNMzCo
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3550dd02c9cso276686eec.0
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 08:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792509311; x=1793114111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DID619nHoGzpMole3aPvhf29bKJwz2HOUU8J+9wx+Hw=;
        b=eQSNMzCoRDtWyRdgh4yAapGijAXxU4udYjv44D/XvO3JYvSwIXOjVLMuxOSv8/NEZf
         qhhKQ4BgnbFqc00p5LeStGJFjV+gqqjaYkdJCQ92mTY1+RuD7gonatCd9+DTj5LC0nT1
         xiZF5iZwqcFbg9t+ctu0my8yHKIIGsI+VfaNjmlHyzG/8RLCpo0vD2Iwb7Vpjee8GWFc
         MHPTnZPHwjeOFcrYhzSqlZGuWUKEjit/hGDCvUJLJnlVIDOvRJjYQewaWC0ffvXQa8Sy
         pKFBrKni+a4NuggE7HLxEBluuUG0jm/SKp/8wux7ApYNvkqTluFG7fbxUncEHQWqou5b
         dR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792509311; x=1793114111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DID619nHoGzpMole3aPvhf29bKJwz2HOUU8J+9wx+Hw=;
        b=n/1yv7JeAdNgD1OJZPx9YkHYyI3WNkHzWmBqw+xYsjQ6esaYKYpIGRIVQgHdVc+hiJ
         3x4poA3hm6juEI+nTIZq1sYikUuEf46m5NrgGNDc/Aiz6oMBz3dBL4XydOWOXdzyV2AW
         jwAeI/pzSQRGRzbw+gTO266ZHgx+sov14Mn95pS60clGCg3hNopa6zQb3zwaXaWIRBXk
         rIdjYF7g5KOsa/ISASOanFql6OP4X5wP+yPdqcV3p5Dax9AfHVQxSpKkBI+GLoXXtZAm
         B1yPLRQYbx7nxaQb2ZtSuWBEA+aUkcbJlMtkc8mtMSqtRceF/nAxTpYfTEADMYmBeNtj
         PRzA==
X-Forwarded-Encrypted: i=1; AKwUvBxiVhgegoLKj642H1IY5hlT/XjBqQJAeC/wyZM3eHnUrLCPcKrF+Fv84/6ZnLTGB8ta9r5uHGIXNc9Y2Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIxTH1CrhZeo0uuB1E+Sbl26p8H74iW0V1mUaOFUXWVbLQo5ZpE
	cSKOP/n4Jn8xiJV+eOdXBblB5FzOzvYiUDc+zviUliYtslWgHU0Ymxk6GdShC3PX
X-Gm-Gg: AYBFou3/r8HDl8898ISHNUxnxnoU5h2uwdVmEc05MCMauEOXugRNAoC6RfKWui12nBX
	9uKeEUx2NWjpuE8GVrORdTTiPpHZtRadfznpQM24JY5QMQ+klN6qchvr2eyotcqqAg8oFP3hvlp
	2RHxr2df6Mlz7PaYP1dMWgHGgIxxMG2qce9XneVpmtj+b/8heYcOeBV8J1sK3u7ZJlP9QJ2sycd
	pCOm/KteFRMA1qj0gJ2ifEpaw1GSKw50CH5KEhwso646IpLsP5SscKEz5CmJzSuVfgGOD3MrxZA
	6SB2OHQjxgCN7rSmXzM4Mxv1CHwd/0kqCRkFaU9pc/w9HEezJnwuoG5Z+NWF7Uo81/xgpJE4j6b
	Y+i62i8jfb3oL7XviQIrZ6AJDxDDNvVJ3L3E5ZhH/1Qq0R8auntsW1EDSsiEsmS4X3LCyhJd32Z
	FzrC81nyd1Ejk6lKVxLiJyM5TNdHSXPjWRuH/YGwJAoBYPoeG3OlDMtMyyhfJGNVdApAK0lxk+u
	pD/QCe8kdI=
X-Received: by 2002:a05:693c:65cc:b0:35e:9cb2:b88a with SMTP id 5a478bee46e88-361a136a601mr22955424eec.2.1792509310992;
        Tue, 20 Oct 2026 08:15:10 -0700 (PDT)
Received: from subhobhai943.. ([2409:40e1:7:197e:d6f5:c443:63e9:fc37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm68690316eec.28.2026.10.20.08.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:15:10 -0700 (PDT)
From: Subhadip Sarkar <sarkarsubhadip604@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Subhadip Sarkar <sarkarsubhadip604@gmail.com>
Subject: [PATCH v1] ALSA: pci: Fix spelling mistakes in comments
Date: Tue, 20 Oct 2026 20:45:02 +0530
Message-ID: <20261020151503.15855-1-sarkarsubhadip604@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Fix three spelling mistakes in comment strings across sound/pci/:
 - sound/pci/rme32.c: 'informations' -> 'information'
 - sound/pci/vx222/vx222_ops.c: 'hander' -> 'handler'
 - sound/pci/echoaudio/echoaudio.c: 'contraints' -> 'constraints'

Signed-off-by: Subhadip Sarkar <sarkarsubhadip604@gmail.com>
---
 sound/pci/echoaudio/echoaudio.c | 2 +-
 sound/pci/rme32.c               | 2 +-
 sound/pci/vx222/vx222_ops.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 214d68657..2ef6e097b 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -270,7 +270,7 @@ static int pcm_open(struct snd_pcm_substream *substream,
 		return -ENOMEM;
 	pipe->index = -1;		/* Not configured yet */
 
-	/* Set up hw capabilities and contraints */
+	/* Set up hw capabilities and constraints */
 	memcpy(&pipe->hw, &pcm_hardware_skel, sizeof(struct snd_pcm_hardware));
 	dev_dbg(chip->card->dev, "max_channels=%d\n", max_channels);
 	pipe->constr.list = channels_list;
diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index 454a30a2c..1d5390621 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -8,7 +8,7 @@
  *      Thanks to :        Anders Torger <torger@ludd.luth.se>,
  *                         Henk Hesselink <henk@anda.nl>
  *                         for writing the digi96-driver 
- *                         and RME for all informations.
+ *                         and RME for all information.
  * 
  * ****************************************************************************
  * 
diff --git a/sound/pci/vx222/vx222_ops.c b/sound/pci/vx222/vx222_ops.c
index b6459dbdb..40f3716c4 100644
--- a/sound/pci/vx222/vx222_ops.c
+++ b/sound/pci/vx222/vx222_ops.c
@@ -431,7 +431,7 @@ static int vx2_load_dsp(struct vx_core *vx, int index, const struct firmware *ds
 /*
  * vx_test_and_ack - test and acknowledge interrupt
  *
- * called from irq hander, too
+ * called from irq handler, too
  *
  * spinlock held!
  */
-- 
2.43.0

