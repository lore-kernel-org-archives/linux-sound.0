Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D538D2F83BC
	for <linux-sound@vger.kernel.org>; Fri, 14 Nov 2025 07:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763107143; cv=none; b=QXR1yFSCvSApEvhvWEk/mApIPEgaNLZhYz2GPXCXg4nBLww7JpBaYhhzRBsO0jtQPcFM4F97xnVva7qUdlEYDrFcvBGdpB/XvuUrHnvTY9Z3Y3AryJEx772Tz1HTArZSAeqB/9/7LuEJyGmShEvs2PQrTlC2Jf0n47WzHW5NJyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763107143; c=relaxed/simple;
	bh=o1rnBfocrHJzjDC8V9OlpRup+6s1WoIhBZarRlOb6TA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WNDxlDIKbsPVy1wsaVg03gWjdS++nrP8IKpBMjQFUw5U1jExSUIkvOhnxw9XggOiF4wy1Hoi6TkdW+2XhylFz4l9FW1t8GLl9pEM9dHe6Zx+6l5w13E9AguR2QElsrj+ve19rvYEJmDUYh3r2U2gKF1Pa03+2yH6jpTFE9kfHiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdb/zCRj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdb/zCRj"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47117f92e32so13614585e9.1
        for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 23:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763107140; x=1763711940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gtugt5POyRPdPZEOkeBhc/9SShTfFcU1Fk57+kN7z3M=;
        b=cdb/zCRjsD24bqxUh08aF9sfItGGOqtrbm/5yvEmQLuxctnJSdR4cdFqup4fdE7+NY
         86CwI+TqiqWeEvHC0/0dwTJHCpXHE9X+ExTzXpPLHksFkRnN18FnwbGZUrAO/iQVMZqW
         bKAbH0jFG0n8nB//d3m1rolPZXqVn1Uqv9OWyUapFcFFzFy9QirFUPa7/hhR7l5JSgLC
         iIMNc3vPdC62nYiIdTd5gX/ObPbC7QLekK9ZqO3iHMrtTJKcgEmyvv5ETo17XvG8hcKl
         9RFasIGqe42V/QX5fNTpU+2NLg/VSCEgv6qNs8O9dKXHISkDeSo2+NlpsfiaKhp8UAo5
         1OSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763107140; x=1763711940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gtugt5POyRPdPZEOkeBhc/9SShTfFcU1Fk57+kN7z3M=;
        b=tJCSrAHM8eRRRse6j/vwy08B+NWkvAMxlw++usemIt2juYFZBEN9zoCUAJNcIgJsb4
         vvOZF+lwHbnYf+E409yjtzIjwPTbOf28JLleEsx+3IVjfH4n01QEfynByBCWbJVf43o/
         GRGDMVyvLQWUYVryTLUSwa/YeTXmtE34ceranTLrIAfMRNU4JFZ78+NwHkksseIYloeK
         CrYP44s2mEwUAtNb1gawFvgN8T5nhf34NJy3lJg5Lx89pRGVYVqMMRdZuXEqFTqyI5H0
         4UvKIxg8lo+yfwvnYXsU8uHwuX5+PerGVkn+5QR5WTcXAuqMPiO8HYhL2V5inyegTdCP
         /IAA==
X-Gm-Message-State: AOJu0YyU8DFwbPoAKmXTBM8MDvsw9Q87FX2UkmZAXoeuyL3J2jm3lMV8
	Wcfno5vzY6RbFCFKLJt6IL52U3b0G4lfWkrlLZhPJj6YFT9Ce9owDu3M
X-Gm-Gg: ASbGncsRTuoqO9AtnKJs1dzWxiQKbBYLiMd2b1p9c89gzfzQzsCgR9CnS7cIBCyJzzn
	rmnp9O2QGNaMQC8nhn5agqnTmKQy9hpN6MDMksaOTM9PQ5/uTF5Mi1E1tFKGBwTMAjjt5vspebl
	syDGZDdTL1SAx8/xz3tELC2A9kFCCv4vMGj/j/dQljbMdr5d3Y2wNrombU6M/s0q4a0ERSiovWb
	S6XEt67TYgey14F+M9P65ow8lhiJSqFLbaSrdScUdux7K9U5ZogiusEh1XMpTBsE6LKLpR+DJ7E
	J/eXXog9iwBIjpXa/NC5uMGFq+lNYotGvf/RbuZbxHxgG3e5gQwwMFwS7VymK5fr9coTuq/2Fv3
	U5Y6kJvi6X1uzJ86LEq2ysRBlJSe174nqYS/j2rCEj5kPegJf/JAdoty9VNTAMF5z7e0q2FNCIg
	JGvbbc+/nOfBPR5mIBn3W60obrD2SFTYB1dL7WUJmYrRBrQzpzTc1d4Xb+h9YZwW74DKn91H/mX
	nEQVpTHhhcOLw9LtHklQq7Z2gM=
X-Google-Smtp-Source: AGHT+IF8ErsAkrTbvPtKk5YAcrD03Pxq+e86LCosiwT1QeFSy/EBdABo2BfsSDRYxYXL8vWvLJIKhA==
X-Received: by 2002:a05:600c:4f07:b0:477:63b5:6f3a with SMTP id 5b1f17b1804b1-4778fead9a4mr17077075e9.27.1763107139927;
        Thu, 13 Nov 2025 23:58:59 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778c847bbasm76347895e9.1.2025.11.13.23.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:58:59 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 2/5] ASoC: renesas: rz-ssi: Remove trailing comma in the terminator entry
Date: Fri, 14 Nov 2025 07:58:49 +0000
Message-ID: <20251114075856.4751-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114075856.4751-1-biju.das.jz@bp.renesas.com>
References: <20251114075856.4751-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Remove trailing comma in the terminator entry for OF table. While at it,
add a space between the braces and comment block.

Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected Rb tag from Morimoto-san.
---
 sound/soc/renesas/rz-ssi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 845a55250d70..21f7d7c7c009 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1244,7 +1244,7 @@ static void rz_ssi_remove(struct platform_device *pdev)
 
 static const struct of_device_id rz_ssi_of_match[] = {
 	{ .compatible = "renesas,rz-ssi", },
-	{/* Sentinel */},
+	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rz_ssi_of_match);
 
-- 
2.43.0

