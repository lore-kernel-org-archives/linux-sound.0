Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A589E3F87F8
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 19:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773774029; cv=none; b=dYq5MNKMgVgP3twDkW0wQ7D9M/3OjpUxoE7aizjnfWEEzRktumTYFOe10+68PX2eOR18Wr5ra7i6FSbK32mpYkO7KxSjSICobzLBEb8vzRAbsV/87kH6N2qFK85W8+SzDw+w6rFkdzHnl9hXQw4WINrtsjfJLg+LRT4GkTFleEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773774029; c=relaxed/simple;
	bh=IMmJ1Uxode6XtjAurdNk51CWF8bJbOqEiTkikuLK0kA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZA3lMlVFlASysKG056I6qi+z5bs4bht0y7ZKz9LPR7hxtHk+Q/tLFUeOmisWeg+KB20tz/lthIj7ksWNZdiaPZ8B0SGNTCwbEQmm332fIJSR+aQfz6ylKBxyK76qZKmUFLJtMrEOM6ro5LB6b3KXt3T8ksHf8jgBQc28mM0eWTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OyqRYDRt; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OyqRYDRt"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so88644a91.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 12:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773774028; x=1774378828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2RhT/UW1C987y6pJfFZ8RN5SYowSBt72Kbbj9XR2UU=;
        b=OyqRYDRtonn4blxvkOO0RDAMk6TP7ykxtPAbYAEm0lQYMiUo3j5byudPtp/Mg/5XQx
         Ga1+uqUNRflDa5XZznCqdhygMoWoN6y7OeVJiehZhr7Nfm/Ab9u8lzZYmdVbaLGVS8m/
         FeQMQghWlAhSEpfwvpU3bTBPivhihdR2K5BdGLeztuyMPofOhZ4JIwDzB+SDkur3EWrG
         EdZtOZJ59l2IsDLf+uRxMVkZKM5PlHT9ybDwjyTUIlXFjsEmnv9nEhzr6Ra99LvsSnSs
         R9pnh3rJYw/PTRo8lUvwWqbkHzPBGkmyAKOGuc0ALIO6dIYyphbAafnhdxqSD8vtwZFa
         swog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773774028; x=1774378828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N2RhT/UW1C987y6pJfFZ8RN5SYowSBt72Kbbj9XR2UU=;
        b=hsRAMaxVAHlFobQVvR94f9LR89szY+N2Yp3KrT35E475uhqbSrZaMEL9Qc0uFC+/P4
         7mO67/p1EjkaUuaDmZhZarHBwQFLLvQVYHgeJJCeZej9EWOhZPqPIcVsCSU+1TM+sqFL
         jAUqC/3yEAK0lkJRnymI6/nv0hfFnRitlSziCWhJcrHkYzMjdng3lVtgMCBxqnkKmklK
         8LTX1V0cr5xpGbSqoZ/Kz8ixyFNDCh/OjASyLv9mJ7irJi0DEOPpBb9ELUzGxJW4f5SJ
         FHgGiyAS8FwZmdPvgTS5a6o68rtdHp/UoBSNVfWPTv16Z5m3pBZPFqrxAxNb205VaqrR
         3uSg==
X-Forwarded-Encrypted: i=1; AJvYcCUCIET88uUOGt8WvFVfFAvw1hPNBBTBUBUIWJS2MF7kWHrLlcGJ+Nl+EQmSbNBSdpKzUbxg9Z0QYwtTBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+36sjWkAGyuEdDce7gKYBJM5d1sRA6pIeWiteC+XHv52PBrOK
	/LxlalwTtGqihz64O2X6IZLJRWuYsDW3oTeBMq++pDOxfOVQWTzJ5kRB
X-Gm-Gg: ATEYQzwW+EMPQjxAp0Qtw4qYbV1EIu894eacaIytCKVR1s1yR6AMeKn/M67oHesTv9Z
	jjQDAK1zpbw2fHm9Zqd69JyzDf7ukzLgOJE1fX+cVYtOtn0dTPNKq02GKzOwjm2Azzw4rwmRjFU
	DSuYnbxjLbjhnrpLC/R7O6/AyS95yAZM4AULOv+4DtIz8T7/nja316CVdxJbwsbNXEZ6mcD+61F
	32gasVZr+78uwCI09JDLCS3isl68zJeWmCR5n1N2TtfsCUqjvVBWYLkA9RSp8Mu8fKQulhU9t1D
	+MzR2bBIiTIAIl0TFVsgbUK7lMszzmzEV6eJqFZpTOS/XjCC4AivzboorRKVkq2b/B2G4HrAozK
	OfmOKRoI8xy5fakam6+LeHusWihOiKTvwA0efBtJbwBplpQVjwWO1WYXCl5VtFO460ECc6+tIFT
	cd7y20m3yXC9gdTGdqWfZ94V+SE6/8tgLN8aUlBfHZhoe93syA+vrhQLQzMG7mBFxgXNGVdAbtj
	hWsPxxAez5eAxDyTPBsjCYmkRN5A5GIuMGDDZL8nAAelFq0fIFGWb6qz30bjNratzJ8vQ==
X-Received: by 2002:a17:90b:35cb:b0:35b:92ba:66e4 with SMTP id 98e67ed59e1d1-35bb99b2ce2mr555490a91.7.1773774027874;
        Tue, 17 Mar 2026 12:00:27 -0700 (PDT)
Received: from 2045D.localdomain (76.sub-72-110-123.myvzw.com. [72.110.123.76])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bba5a2c60sm196240a91.9.2026.03.17.12.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:00:27 -0700 (PDT)
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
	Gui-Dong Han <hanguidong02@gmail.com>,
	yangshiguang <yangshiguang@xiaomi.com>
Subject: [PATCH 1/4] debugfs: check for NULL pointer in debugfs_create_str()
Date: Wed, 18 Mar 2026 02:59:10 +0800
Message-ID: <20260317185920.43387-2-hanguidong02@gmail.com>
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

Passing a NULL pointer to debugfs_create_str() leads to a NULL pointer
dereference when the debugfs file is read. Following upstream
discussions, forbid the creation of debugfs string files with NULL
pointers. Add a WARN_ON() to expose offending callers and return early.

Fixes: 9af0440ec86e ("debugfs: Implement debugfs_create_str()")
Reported-by: yangshiguang <yangshiguang@xiaomi.com>
Closes: https://lore.kernel.org/lkml/2025122221-gag-malt-75ba@gregkh/
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
 fs/debugfs/file.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index 3376ab6a519d..a941d73251b0 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -1127,7 +1127,7 @@ static const struct file_operations fops_str_wo = {
  *          directory dentry if set.  If this parameter is %NULL, then the
  *          file will be created in the root of the debugfs filesystem.
  * @value: a pointer to the variable that the file should read to and write
- *         from.
+ *         from. This pointer and the string it points to must not be %NULL.
  *
  * This function creates a file in debugfs with the given name that
  * contains the value of the variable @value.  If the @mode variable is so
@@ -1136,6 +1136,9 @@ static const struct file_operations fops_str_wo = {
 void debugfs_create_str(const char *name, umode_t mode,
 			struct dentry *parent, char **value)
 {
+	if (WARN_ON(!value || !*value))
+		return;
+
 	debugfs_create_mode_unsafe(name, mode, parent, value, &fops_str,
 				   &fops_str_ro, &fops_str_wo);
 }
-- 
2.43.0

