Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9373E63A6
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 13:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776171860; cv=none; b=FW5sciM16krCdw3MwBfj+FAIzbEovhtm364ns68G5xYeVEGmJHau5lMO1+j8rAq3VcMUKwqfylC9+JPB29L+7M2b0E+zY3O7yCoIjjfcKVBo/n4aOiCWjhZyvJ6RYUP0TQHgougpLW4KpebDB3FefOr8Xxnd+ivJYNupBQ+1+GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776171860; c=relaxed/simple;
	bh=4/AER0+79jUWl6FaRfWd3aGY/aJ6MEcGm48BpGjFB+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q20F/E0Vb6I+QJVIGabg8VK50mmk7b+fVEZWYy/doQBXVD7kicO1H+Uop4PdMW8KIFEE6Es7MbHy9FfGP8+QnOvRn578G6JLUAeLWDREiyJl0Xkn4chZrRg3VKIHciSiCZbQyLmaBjOQULl/Ch3VrESu66Lej1FCtWmLHS9PXiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9aVets9; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9aVets9"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ab08e6c553so5655325ad.3
        for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 06:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776171859; x=1776776659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opcylBd2GGN1SyilCKpA4V3rg0BLKqf3938q77JOvpk=;
        b=C9aVets9yeSzJe9hZrf9sflWrbgaQDVXGBVkHRK4icRXkXC04qXsI6dSoFwVLqQYuT
         7ZWEcH0DQNUsDbeusJxX90smZZIBFq8yQur4Az364q5KUSrGmLpL2ZA65+RjlCoh40z1
         sfNToR4EGSxF8jlRc7x8be6y4MGqoYswm4RUdImfPkrfeNQO/QrLbLjOLzzbjEKKioYl
         7xic3EY/Pk6Lb8RTuirLJcRr1Z21Ji/xaeSoB74lTXR7p2bU/jOS6psQ8j6apm5uOBcT
         NffVGuxH6Cx5+VMmTxvkxnWKkDq7uHXqQT2G3YlDEt/gtp9XnmhKZxzZtIJLnfCCMmFy
         XcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776171859; x=1776776659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=opcylBd2GGN1SyilCKpA4V3rg0BLKqf3938q77JOvpk=;
        b=SVqAR72/K2yUBxSag8RR5qkpugNpzWZ7gqqKiYHRxk4rwSvz2TjGsalhvxDYOZeBW1
         oDOcUqB1g8IQ87hgDS8un7hMeA3yWYMwnOqg/mgXG9hpWMGeYDK5IJUBlOiSeP4fHXic
         +pA57buT5sDnZjxuXEGmflO+fyewdE190VrJsdPC8pQfwskAlbA8u90Pim7izSsY50ye
         yUnHrIPnDCN1f3Wst7Da/SJOMw26q8ds5skyn6VQUR0BKZy4clmTv9xMBPJBBD/fJklS
         Q2rZRc8xOTgLjUCv44OiG9Mzr0NEK+QYMyzh+Ig5cf5vUcxsjt97BuBrqLV9DuqgOtwx
         EJjA==
X-Gm-Message-State: AOJu0YwC+f4NeYmc4/6bDJVWUvXKaHmBh+YuIWXQ4Zgv//W7T1EJuOcs
	sKOaX2QOwvcgv1nnVFbqJulHd5ed5HSDcLNk9zq0452eelMg2JveT43u
X-Gm-Gg: AeBDievm1qIYLUkSWYVoCTSekAbHLcC0Jp0HzT27JxvdX2987ZFuChoLcEf55fYkH/t
	gA8aHUYmTIVC3UW4NURQ8Am0Fc8xG29lO4uMNDiA/aUlVRNnQo0iWZgyK0nbuQBR4EU6Tf49p4p
	JwcZ437ED0bgyhvAX+mCeCFlBpRYSToV1l0HZD++DKkwDiU2+dAeso+6RkZX8lbzLEPbQGe0hkX
	smV+cYzOupR3mX/CVTAe7TKizFEO0ZBpowFtjx1J0gBCpUpWNZxPGE175sbD+kFWvwAIQodns3J
	yJCBo8G3NlzgAC1hqZ/4Nt8rIQ6g7TW9DQT2M5mcDU2dhUcwp0L53f3J5zNw3JJG5UsgdQHeXy2
	g6z/84LhptzcxhktP5u656NvbGPUA7o7FiKtZFLi91rXksP3p2exJfoppDaFryB/MdMPbaeXDDD
	kgru9ZDkoXbGWWlFR000CLAzK5ubJImv2YhCMDWE1oPxE9vkm4lRL3v8ZuCJgrteCHxZlmGLY=
X-Received: by 2002:a17:902:b213:b0:2b2:aa7b:b3bd with SMTP id d9443c01a7336-2b2d5a6e4famr76571835ad.6.1776171858706;
        Tue, 14 Apr 2026 06:04:18 -0700 (PDT)
Received: from mi-HP-ProDesk-680-G6-PCI-Microtower-PC ([43.224.245.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45d066afesm70522445ad.8.2026.04.14.06.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 06:04:18 -0700 (PDT)
From: Ziqing Chen <chzq96@gmail.com>
X-Google-Original-From: Ziqing Chen <chenziqing@xiaomi.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ziqing Chen <chenziqing@xiaomi.com>
Subject: [RESEND PATCH] ALSA: control: Validate buf_len before strnlen() in snd_ctl_elem_init_enum_names()
Date: Tue, 14 Apr 2026 21:03:33 +0800
Message-ID: <20260414130333.244544-1-chenziqing@xiaomi.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <87ik9tsukj.wl-tiwai@suse.de>
References: <87ik9tsukj.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_ctl_elem_init_enum_names() advances pointer p through the names
buffer while decrementing buf_len. If buf_len reaches zero but items
remain, the next iteration calls strnlen(p, 0).

While strnlen(p, 0) returns 0 and would hit the existing name_len == 0
error path, CONFIG_FORTIFY_SOURCE's fortified strnlen() first checks
maxlen against __builtin_dynamic_object_size(). When Clang loses track
of p's object size inside the loop, this triggers a BRK exception panic
before the return value is examined.

Add a buf_len == 0 guard at the loop entry to prevent calling fortified
strnlen() on an exhausted buffer.

Found by kernel fuzz testing through Xiaomi Smartphone.

Fixes: 8d448162bda5 ("ALSA: control: add support for ENUMERATED user space controls")
Cc: stable@vger.kernel.org
Signed-off-by: Ziqing Chen <chenziqing@xiaomi.com>
---
 sound/core/control.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/control.c b/sound/core/control.c
index 0ddade871b52..6ceb5f977fcd 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1574,6 +1574,10 @@ static int snd_ctl_elem_init_enum_names(struct user_element *ue)
 	/* check that there are enough valid names */
 	p = names;
 	for (i = 0; i < ue->info.value.enumerated.items; ++i) {
+		if (buf_len == 0) {
+			kvfree(names);
+			return -EINVAL;
+		}
 		name_len = strnlen(p, buf_len);
 		if (name_len == 0 || name_len >= 64 || name_len == buf_len) {
 			kvfree(names);
-- 
2.52.0

