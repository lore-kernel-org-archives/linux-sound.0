Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38E1378D9C
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 09:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256541; cv=none; b=SqoM8QCchb8sv5K8/BQ5RMcRx9mStdu9QgGs754kAh0nVu6ODaIf2u02/CEqHhW1lkOGeP/nyHQJIoMQzl2Gpe1f8M1uuoaS+I6Vf5fgaqUpdlzKPVMRVqknsyjDLrbrbNGIFWBz8eRXiRpZYpADRrvFwovPEuAzK++7hE1uyZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256541; c=relaxed/simple;
	bh=gq1YDhINbE7C0TGxm6aIJ7yhmIyt+boZmjgdjZwN9lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G0W808/5I5ccmr7yW64pQrCDCiVXfhjzbbTm60c5XDKQd8xuhpYb/a8I6pFAQrzLgdTGFpfbVO5cseolI8+incNGpNE0AsmuFYQeb9AL4N40aB5D1YXARmteAvXu3v3WvEA3DCo9JqnUTwp/2oYKcQbw8qyGW/zagBpOz8CNWaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O1KxNi6N; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O1KxNi6N"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12732e6a123so5216662c88.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 02:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774256540; x=1774861340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xrYmE2Pi3T7YtcUDRXPeAvmyynPywp5N49YDr8P630=;
        b=O1KxNi6NcDWwXyuuC+K00379yFd7596tsyRp96TcHOHuBORw63dMbKyfJEveAp9vY5
         vHJOY5vVi9LVq/dYyd09VDDniJhOECMk3tY0vLmPmrkVAJucoXa/42JuRmN/I+WilplA
         vhMNIvzjPF0uRdCGTWLxA1TBrHocCuosrhXnnxiD2G83rLwf1kFTj9S4pGHQHYBa/3p8
         jQvBRSV6McGQtkDIIQdyBspfzcLrmNCvAkxROyovCeG7/DGezoDUXXWokVKej9KQbeGO
         6TG95xw9aQ2XWMCLSSdshbzXRtyZMMvKmLC5gK1I3omf44r6YzGYtQQrlz76cbD9aaZK
         lEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774256540; x=1774861340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+xrYmE2Pi3T7YtcUDRXPeAvmyynPywp5N49YDr8P630=;
        b=kBBNtCDq/2UBSGl45uFLoT/0hk+MN1VoMRo+Sjy4CqLycKYlixdbrWphDwb1KFgoaJ
         l+m29qMIYR59d1mGJdwpcnvnd21b9zFF4JURnCntoSuwq84xAV1d0apcrc3C5cOsUvek
         s2evnBnlv7Wqf+0KnPiWPdsLYpvim8U0CBu3HubKEjSDeIGmc0TrWfIYvoFOSYUVeSDV
         KuDm5hXO2JllqT+6zvD7g+ANbmqHRAVVjXzNknjPfsEuL6kQAERdiQIbgZgl9+rHT9AX
         zJZkyIaMkVzRszUYQjQmVZKunkr6uFelh3Yg5okT6K8zeB403q+VzF6BgjNfWWrkHF2b
         oi2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFiGvHJaJXS7p2HYPC6NkuhqiHpsrNPSqG/shA8adgiV4M7H59/i12FhaV7XKccuygjgpx1JM0Zt14nA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6oV1CuZfd5NMJ2xeATpolwM3gkK5oXdlxQCWvowTx887Atrme
	SjkT1OuiRXAEPS+rXBciSw5Lj6laF9SLWrrey3sx8P0qIdG7kQ5rNAym
X-Gm-Gg: ATEYQzxcfDCBFXsqORo/4FLnFhFeT75PEEf9f0ZhHOMj126zSBgURDgXtRJVCxVxyAb
	gJllL3ETXQ3YMYtkyDL8Gc2R+zO6UWaFhjn7jY8hhO1nj4/LAgwlgY+9CJIC21aqZq+RAXVtAkZ
	cii5WdIjNOHfPxre9AbnlR6CIWNFjoe+lDJFUE85BXILrFZCvCB56QxbZA1VrjviV6aDkupBBLE
	vEW1qCBxui37IqIWkKrrTdmnPTxIBvHLdmSp+DAAmIDo/mYKXrkdReeayFBQuhIva/3GmBYvQN2
	buGDz28leu/U8aRqOkE3PEcqKtOi3oiY4h947f4x4uDgn26kgpq/wS/nU4dtTkBCZXn4SKbIjU8
	gatq+/U/27BrwZpwE6hIkHlGS9kluYcHd8hROc2Cv1n0+LuIxviUoSgAcTTOyklxAxjsrWvGejK
	8rUyF9hzouCZom7Xv/2eqDyRalZZ7U+BIjR+NsQAfK9+Xtxl1UuK0IEQNE7X8ppr+fEHUn+vFOR
	eOQ984wWkxwhY9wyeBXp7G7cR+Mi35h6cmFHWwOdB0lWY9mc+TahZ1waPE1sqFSlkQ7if1YVvdb
	sA==
X-Received: by 2002:a05:7022:68a4:b0:124:9e46:82d6 with SMTP id a92af1059eb24-12a726d995bmr5281257c88.25.1774256539707;
        Mon, 23 Mar 2026 02:02:19 -0700 (PDT)
Received: from 2045L.localdomain (90.sub-75-221-98.myvzw.com. [75.221.98.90])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a734bb33fsm8620227c88.9.2026.03.23.02.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:02:19 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Cc: peterz@infradead.org,
	cristian.marussi@arm.com,
	sudeep.holla@kernel.org,
	linux-sound@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	akaieurus@gmail.com,
	me@ziyao.cc,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH v2 2/3] debugfs: fix placement of EXPORT_SYMBOL_GPL for debugfs_create_str()
Date: Mon, 23 Mar 2026 16:58:45 +0800
Message-ID: <20260323085930.88894-3-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323085930.88894-1-hanguidong02@gmail.com>
References: <20260323085930.88894-1-hanguidong02@gmail.com>
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
v2:
* No changes.
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

