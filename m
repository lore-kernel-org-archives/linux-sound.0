Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3128B21D3D2
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 00:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151737; cv=none; b=NmMT0dDVGsQp5NHeqoQTBF8zWWql41b4TMr8G1VpXCJacUipDraeNmlziLCWw1j/zYju2iq+ijRuk+RA3u4YfLSH9+yLqZCIarGe98WYMkfdfbDEbqu4iz0/hVaWkOXbvysvesFbuGa5qjdxOUfv6eKwawYG8OOZuVPesQFVpq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151737; c=relaxed/simple;
	bh=Uig37WdEUY3ttZi5t20LDDLjSbMzJjyTGnUfEwSsyAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZQ5xp2BgSs9kS8EQLUeVXToj4zExCiOcH5Q51X/WOw/bTYD9QKi9TBWq74vbr8q6MUK/UwS5PWP5kcOqDUFdgQtvBNN9fMmDABBxviOiUKPMUxBwNxI5J8lnnagBEJ6ET1Nu46F5Bd1d1xuAt0vtMIzSLOkbHVkThqphakPTPCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUWtEsks; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUWtEsks"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-910bb291688so376407885a.1
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 17:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779151733; x=1779756533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AiuZbKa0lCdEVLvehNxd//IbAR/o7I924nyOwe6KhF8=;
        b=ZUWtEsksoRpNpakd6tJ/nEACuCZdcNGD1Yi+usOitkiSZpMZmzZnx0CaxZWjFwrLZw
         M3+fkpM7AfOhguVmVifdqlC2B4BIweCFm3TURg1UeQoz1kH/PzprkdgrpwR1iyLqsfSx
         zBKjboc33XGQpI6yYX0AC9BlkoB2LCZqcDZwlHBLsZ0G12ud0DJr1sU3mQaCaiWBsAjQ
         MLbldNiDfY6vDfJAmKjBtpFpn9leB88dRZHPh8TIokz2OMchYFNVaSGVU4C+LOUFODi4
         CByKqaERNYBTKN2a/Og5rdGmcNDSSjW99tpxktKj/Q46rYLmz+mpo+aju7Nx0unFs0P4
         icjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151733; x=1779756533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AiuZbKa0lCdEVLvehNxd//IbAR/o7I924nyOwe6KhF8=;
        b=scPrCKR/wkaxtq9AMoDDieb2fwVCDEbh18Dri1GTHBVIOQX2D4+0Fu5JmarlLogGFC
         SQ6pRdlnQOxPxavvmuu3W8uAH2hk/B1fYNFBoWXAec+ZmEXN/4EqTMp2narkOS7AwdHN
         UjNloPNendhm+bPe9tRiVcLcVEhPT88+B6zR8y9Jxv0hyCosaMJI/9FATzWw/K73HEbC
         K7uwErTFMcIndC46f/hWWs9KgAZp8nrkVBIsZHWjSRRuaviEC+US+WumYuIfy/ZiNFI/
         0ZVKzZaBTxZug+orIfQ9ZwwTKpuk2M6nHQfaQvM3+idqaJfvlLNwsic5eOPrNHv6IoTs
         Sgpw==
X-Gm-Message-State: AOJu0YxfZa2mCMVF8Vc9E5ar8up5DLd9khfJKciycek+kGnMnjutxL6r
	+fUM04Qdl7yax7kkyaiggCo84pd9EBQ3kR3CaM99cBsDgtuY8rjy+vxzjnhrdb7D
X-Gm-Gg: Acq92OFn7ltMEX2KSi8/USDwzFlztZvSJ1Zp2PxZUAj8GN7TntrRHOhRF1eoFjpopIi
	LeHaPq+3X2VLwxVpOBk+Bw1PSuR53k4CnERWcadbzXEsblqpF/jESsy4XMwhmlsrVpPRMtZTMnU
	cPUfqj2ywYlSDtldkkj+BZP2g2HXtjFTBkDLfp7GURuzGm+advfOUbyvfZGHek/qkn1HgwE6LXa
	px7866iZs6CqZrSApVF0KzhSWsuGs3ikAXEIqFITFV0ZXh39zoMySYpNpVcY7W4VOsLirU6RMQu
	5L7hQqG0xkl2RVui16vL+WvnfCCdFvBx2cC1HU90B8lG+JIRUkn4HVUwPcGtrTxhXfjEC1llkcj
	S0OGtLWeSAVJE5LBPPO9vfFiVRK60ceIO46u/Im25GYGCqz/4n5r7fYPjxXzI1DjEOT10P2i+js
	PM2LYeXrr+0pNpV4UF5HH4Om4MoDqdOxFUW7LRMC0edrNp49vROWGEczgx8s3mnu1rIUCuK05kF
	Qmx9J7d6TsXiK/l+lcNdO7G7Ev0gfhkGOQ=
X-Received: by 2002:a05:620a:294f:b0:90f:a90b:86ab with SMTP id af79cd13be357-911cd572a5amr2651813985a.24.1779151733216;
        Mon, 18 May 2026 17:48:53 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91433530506sm573490285a.44.2026.05.18.17.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:48:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: "Geoffrey D. Bennett" <g@b4.vu>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ALSA: usb-audio: Use flexible allocation for FCP packets
Date: Mon, 18 May 2026 17:48:34 -0700
Message-ID: <20260519004834.627676-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate FCP request and response packets with kmalloc_flex() for
the trailing packet data instead of passing the computed struct size
directly to kmalloc().

Keep the computed packet sizes for the USB transfer length checks.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/usb/fcp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/fcp.c b/sound/usb/fcp.c
index 0fc4d063c48a..ea746bdb36ff 100644
--- a/sound/usb/fcp.c
+++ b/sound/usb/fcp.c
@@ -191,13 +191,13 @@ static int fcp_usb(struct usb_mixer_interface *mixer, u32 opcode,
 
 	struct fcp_usb_packet *req __free(kfree) = NULL;
 	size_t req_buf_size = struct_size(req, data, req_size);
-	req = kmalloc(req_buf_size, GFP_KERNEL);
+	req = kmalloc_flex(*req, data, req_size);
 	if (!req)
 		return -ENOMEM;
 
 	struct fcp_usb_packet *resp __free(kfree) = NULL;
 	size_t resp_buf_size = struct_size(resp, data, resp_size);
-	resp = kmalloc(resp_buf_size, GFP_KERNEL);
+	resp = kmalloc_flex(*resp, data, resp_size);
 	if (!resp)
 		return -ENOMEM;
 
-- 
2.54.0

