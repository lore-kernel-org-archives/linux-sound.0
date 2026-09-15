Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28774A3D33
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 08:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461910; cv=none; b=g7virrg2I7Fpkr9R/ePHEoO3WwuTIpyZjMqBF/T6ZNLKlRy8caT+Sf5hVv9Zl6QtSP1+otiZbnN+VolRu4MG11chVNdbc6bVkUYPc6mtu0LFn196Dn0agR9n6qGCasz6k9QheSwc8OYDEziGjmyeBscdXhT1G8+ivCSaG5y6df0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461910; c=relaxed/simple;
	bh=pLp32tAoUOy00uCEiYMD5HR/iTyFQrXmjSsM/RDp7Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lIGlKOYRMjMKS+srf7bR/8lEbxy3DjoJb+3TTDyijT3m/4ybVvnk0mGW3ljlEDkWGW188II9+sE95xHkgG9g4YyIzxOWr9gRv4+LGDdNxuLpxKLfXiATmRp0Lr+jNn/Ln1rnVS/N5G+k0tPxbAwRLlHWb+ktvxzDD27mtIHCASc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=orRsSsMY; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="orRsSsMY"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc149372c14so2800807a12.1
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 01:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461909; x=1790066709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+zXHsB/KfJwBbRNPmMoCi7j36VYfrXZEr7cEEFDuLOM=;
        b=orRsSsMYz0m1gQ2twQRgGIcleGquvAxTQncB4Bm9YZidkDXVpAbxFQnfygTSHEiZSL
         1q3Ewiu8W4yDr77koPQpExsv8fLBlGZ5CFC5Kj4XPvfS+Th+gkokrbTPp7qRzY3TNLlH
         1m6klP/VfSKknM2EXyh8RkyzFNoNmnp0CPtAxBDN6d158l2JRIxTWlC/LoXjnf4byDei
         eF4gdI9aW501xAtIl8LKPvRcOG0xCbh72CStKzkkrWirXJzNNjy8UwpVzqojsS0wH2wC
         ohdclFIuAZHGFwrZ2WcNS7+RGlEN6IG18HU8BVepsRRLIPoRUUTuh+fbo4v+iunxyBPL
         OMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461909; x=1790066709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+zXHsB/KfJwBbRNPmMoCi7j36VYfrXZEr7cEEFDuLOM=;
        b=fDp+3Vs0jLqkeknAaS6iJxk+yVc1/keS9YlukS4nL2YTbvvCIz0kqk7WorOpm6uzKV
         8ZMZWho0CZy5kYnS+5VyFDd4gOkNguVoXgSrLhXrTTTu+WNpbWYX9IY3g4eySP/O1ecM
         Pf+KDmN8FFi1u892FJpyLkI6iVLnR+oVmWVR0hg+PYobB1Yg4xzYsOWK0z7uXbc6v5qO
         /UZq8uZ57haaO6+wkY90+YsKgr4C/GMqFrm/UXKXPzxFUiDzQ/WQPZAhFGklQFg2bY0C
         0upr2lP/iGdqXoyaqrWxzyU0AgyNaE6mL97Eg5nogiai35R+uQDcdL+uBBWt3oifPmxr
         +cQA==
X-Gm-Message-State: AFuF++k2Mhr9RQj1FWK0wGP1oZJPyFOaw4b9+jcTQxLoM2JtOmcGAx2I
	xVFAep6XstwXtPKHEE1mKH/F+pX1XRQi/ER7f4sxUb+6wO/QXG/5RVCG
X-Gm-Gg: AYBFou3xF9JyWJJUj4Ud51C4gN5zLf5C1ThcX7mWJMPOPgU0NsoiSRHOqP6KsWdeuWN
	tYMY5rhqHSyhQY4mskXC6nLbtXx0UNy5zA6jFS+nhW648hA+1s1XomUXfp3hpQs1YsGDXpaLo6e
	le6ujyclc2zAk7+AuFSiEKVYYNdiykRoVcqxqnmHGqIStoYpvyvrKxkLaAq0JmUitUmXAuv2DZt
	vOlV4AiU05PpHilN+fHkjBNgCEQaE7EKPPB94t89LhnqhOalxXhPhjKCYdVairVklPFmiUtUG3F
	OTbfLBx8dpxq1H9FnYaBMkJ0bZoa3q0ABOPgX87GIRh1ZfLWZUrVGl+TpS7FSE3kSkAwGC8SupP
	JlaqIbmn9IoceBij8l78vfchVuAOi5JyRjL4D9fQHxlGSdwxARCOfVI6qghqN20QNjsVaEX2xpE
	uh837hfsW+nG3XW05ktslawS4jablpCNiAz3HVPanRiLVIiUmrOxeBL89SIgHQtVWkITaAfwvn3
	Vu6+EQdPx8kpT9rqa/7OlXt6w==
X-Received: by 2002:a17:90b:5886:b0:39d:f253:ed66 with SMTP id 98e67ed59e1d1-39df253ee28mr10940715a91.22.1789461908851;
        Tue, 15 Sep 2026 01:45:08 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:45:08 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 14/23] ALSA: cs4281: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:15 +0530
Message-ID: <20260915084424.1007757-15-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/pci/cs4281.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
index f51f4bb63766..27ceda6278c5 100644
--- a/sound/pci/cs4281.c
+++ b/sound/pci/cs4281.c
@@ -324,7 +324,7 @@ MODULE_PARM_DESC(dual_codec, "Secondary Codec ID (0 = disabled).");
 #define BA0_SSCR_XLPSRC		(1<<8)	/* External SRC Loopback Mode */
 #define BA0_SSCR_LPSRC		(1<<7)	/* SRC Loopback Mode */
 #define BA0_SSCR_CDTX		(1<<5)	/* CD Transfer Data */
-#define BA0_SSCR_HVC		(1<<3)	/* Harware Volume Control Enable */
+#define BA0_SSCR_HVC		(1<<3)	/* Hardware Volume Control Enable */
 
 #define BA0_FMLVC		0x0754	/* FM Synthesis Left Volume Control */
 #define BA0_FMRVC		0x0758	/* FM Synthesis Right Volume Control */
-- 
2.48.1

