Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98B03F7896
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 19:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773774048; cv=none; b=M/XwMYyKAYcXsu08E22uiThgQQnI+y/93dyh8DmGuL7/2UqP/Xs/i1+mxxEsAH8pzz2w9wyaqbIvsae8EHlfNftkTnafDEfEX2w1gK+ySRBYRu625GzdgsFxIzoFQvH5z3qpQ0UBn4fARNBk9do5BMbnxuJ3iPt7KK4YITQxUPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773774048; c=relaxed/simple;
	bh=u7g7PqC1ksiTGawd2FT2mK39JtKLQRmCXd42/gsT/iA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gy9nqNcH2CxJ/jigPOpiEQDc4GdVNNSd9Ao/fz04JgsMRNiFK+/jAPEkSMsJwQL9JOjOqtsqDN9u6G0L904/bUn5BDM/M4KUT9YWywo9j/Q8Izvv9PpkgpgRAHenjCMuehWFJFBCCfOhbnaaxrd5vg1/KE9ofcaUp4iSUZc0NzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/aJC8oo; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/aJC8oo"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35a1d4a095bso127801a91.0
        for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 12:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773774047; x=1774378847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5pUoPYvzvdY/i+3VyCKmXdQJFa9RgqmeQepWrHmR+w=;
        b=S/aJC8oo2uH1NpB2KCo4H148SjNq/uPyfeOTEggqy8ayYRSp+NBvnhxn1KUUZvFQva
         aQkDxm/iJ+UB+qsQmNsOvZubapgkjvpPKLgkWkPxqBi/KAkrx3tA9HxAxwu5WmREp82M
         3AEvZRuOT2Aj6gI2P5KoyfA+Qn1LHWuVm4rNQ/l4GIt1T66sJI+dYXSJpf9Vvcpy+yVU
         ZYNMZ8W8mmq3TEFmnRaECnM0+H/EyNkW5W7cn2LX7PU787tXrORaXe9Pz1HzVpcOO3qY
         16ol3ZTZi735NfT7jWbE2X+wVofqxbxgaVm3Z9YzDimxgVUuPoH8zZvZAFckDtjaVOd1
         53KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773774047; x=1774378847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G5pUoPYvzvdY/i+3VyCKmXdQJFa9RgqmeQepWrHmR+w=;
        b=itgMNU02qzNhAuC4YBm8wZ4z3MfG7IqtJtEfbCzcxQ1vBMsTDx62RhUE/vXrKrNzt7
         52QLMEZayjFT2Ylk1s7QFTTdjf687tfp+ejuLhDC7hb6zV6sGcc+Ig8e/bYc8E7euhfo
         7Q0InU87UCnWd6QCESTEkMsfEcWzWbTO7ZExg8c3G8Yrv+IAg8fDGqNJ07RF8AXpow8L
         IkuuBvj/hDrOP+q5lixANDAY9EkZ868lsmO7KI+ETP+RzlkSM4APZHLrw4uDvQW6itTA
         Emt83jPEFi76jSCf2XGxLmIHPw6hs4zvuUUmf1VTLj0cnOR9/KrhUSAfMrhAgwz/9wh/
         gD9A==
X-Forwarded-Encrypted: i=1; AJvYcCW9qLKgwa9eu8l55+CnE6D+BFW2pCJ4Pu45EITTxRk7eYwRIk2sSFLT5uk2fufNFBfK5jWGcamVdCOFXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjitT+W6j9Ce8n7tsrJ6TQWfvj58oWT6DqD1c6OKyJq5EVNvgh
	PLjdiicNisGfzXLeWJMgU6ym1GNFUZbppN5aTW7VK1cjrZs5B9eh2KxL
X-Gm-Gg: ATEYQzwr4kR4YNZTGG+LMg9ZKYlk0uCs7KdgFY+6ZR0Gb5lbOpNWgkcaXIP0kgLGJyc
	QW9cpKbVEL1+D94oZBR/Cx+AIWaYOtOh4gvMsfqnTWiMGVLoRNAxBBcNIIpVZ20x+aumaivK1Q5
	Jah20FeKJYxQbtHZnOOkinhDB2QKNiRkamQSRtZxn/vE/WMtKKIjm4POSR5+NNi8rR63SvCNpDH
	iiNOicm6JhQRk2O4lmJ7CiCRhtc38adbjrTGrrtDBLBHzQnQDTU1h0bBEhh/Mh7GtstiVSPMGW4
	43yFr59tyeIzqsSvenUOlw+pfzQBsqFPU6NzOMO2l0Xb7Z4wPRhq2/vluGWYvqNwtLToulbTSbY
	KdY5HXz7u057SAow0YyA2DjtQSPbJUSF3ipMuZFRdoZzBbGSqdIvZ5qbu8S4HkCHUoQFi8fg9vl
	dSBCdXNU8WQWzChkRyMW98hszXZn1Q7Wdy+X0KvaxFCQ8e8Pb343t02NuN1KKkqzwd+Q3Mj9Kti
	VEB8uvaxNuMBBZ+KHlpKEsNGf+6TgF3bwQ0iXXZPvgWT6RMQmdyUS/1ZvEV/BWZQ4yOTw==
X-Received: by 2002:a17:90b:3a47:b0:35b:9f51:a755 with SMTP id 98e67ed59e1d1-35badc14391mr3481930a91.18.1773774047144;
        Tue, 17 Mar 2026 12:00:47 -0700 (PDT)
Received: from 2045D.localdomain (76.sub-72-110-123.myvzw.com. [72.110.123.76])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bba5a2c60sm196240a91.9.2026.03.17.12.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:00:46 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: gregkh@linuxfoundation.org,
	dakr@kernel.org,
	rafael@kernel.org
Cc: linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-sound@vger.kernel.org,
	akaieurus@gmail.com,
	me@ziyao.cc,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH 2/4] debugfs: fix placement of EXPORT_SYMBOL_GPL for debugfs_create_str()
Date: Wed, 18 Mar 2026 02:59:11 +0800
Message-ID: <20260317185920.43387-3-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317185920.43387-1-hanguidong02@gmail.com>
References: <20260317185920.43387-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EXPORT_SYMBOL_GPL() for debugfs_create_str was placed incorrectly
away from the function definition. Move it immediately below the
debugfs_create_str() function where it belongs.

Fixes: d60b59b96795 ("debugfs: Export debugfs_create_str symbol")
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
 fs/debugfs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index a941d73251b0..edd6aafbfbaa 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -1047,7 +1047,6 @@ ssize_t debugfs_read_file_str(struct file *file, char __user *user_buf,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(debugfs_create_str);
 
 static ssize_t debugfs_write_file_str(struct file *file, const char __user *user_buf,
 				      size_t count, loff_t *ppos)
@@ -1142,6 +1141,7 @@ void debugfs_create_str(const char *name, umode_t mode,
 	debugfs_create_mode_unsafe(name, mode, parent, value, &fops_str,
 				   &fops_str_ro, &fops_str_wo);
 }
+EXPORT_SYMBOL_GPL(debugfs_create_str);
 
 static ssize_t read_file_blob(struct file *file, char __user *user_buf,
 			      size_t count, loff_t *ppos)
-- 
2.43.0

