Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942584;
	b=W1wEbTycdPCq3Gpbh54GhzQntcrtGkifnVMa5AVeLP9SSYvWl9qBkjWiuZFXw4VVwXux
	 Jle1CrhKXTpsTKoBJm65txb7td27DEz3GDIrwewNxG6RRYJgHD7Ecz61hXFU05inVA5ED
	 CAtx5dwO/+IWU7718QuzLBUJCFQKxxZ+l6SVAPmblJqbibvyMVj1szASnKUNgW2scYlRW
	 Rz4smy4paTlQRPxNcxps02bcRZDyNaI60mxeTDtFAOjvwcDM1aUHYnQISnjOk3BWBWnIH
	 HnxPvgITlgjdfgvM/+Fp0kbToPQQonVuGuGbb+pJaDWrIvBL0zxBKKsbxjCbZmY1T8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QgjUQIvs3qIFboQ8HXSfJd5nUrq2pq/h3iYL5W7cQ3Q=;
	b=yWHNVXHQz8NEiDIH/H4wm6iNigLvNTS0ePsxwcyiqh7jt88QEJFniXfkqPJtNjX3MWao
	 8EBdPbWp6xM73dmVxOcy8ScpQNQZ9YoOFGCcVC6/2RL/qb+cft8aRh+07EsT1NtB8c3kG
	 /wl08hfzz5x+KV/S67YGEmjbMDjxl30DljobnULLa9LiI55nTsykSy3YEqnhYwPHloCdp
	 Aly3vzfm5vXL+8HrW/G/TAYB0CUhzLvyBTHPuJwEQHv6ljCf0XtZu8v3Buk+31E9/naMr
	 kV3IwQgqzbgEZk8JQg4Up7XeUGvVFsPK/DtsSPr6//CEukche4leLhM7Z44vBUyEfew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rQ1noQVi;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A75606A32C
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 05:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5A75606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rQ1noQVi
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-89f85edd210so89926b3a.2
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 21:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793942583; x=1794547383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QgjUQIvs3qIFboQ8HXSfJd5nUrq2pq/h3iYL5W7cQ3Q=;
        b=rQ1noQViIAKFIn2+u9hAW+IPrCT/pPog8gbXMLjSr1UICqd/D+9RYpcICDNkBfjJrL
         iY/IKpPSD+gW7brrB1YMAdFH5CVocoMrjEamfF5yySiiiyrX0g7F8iUfT63obhu3+son
         IIx9J1FSJ0VfzBBSg8iUxG15/tM40t0ZbumcBE28DUPi2BBuEZ+Yy/AKMJNllmkmmL4v
         oxLfViUd1oOs7YZqrDZETrmwAbip5jtkL/iJuuKKrJcLyCGOuyaGgP7UhrhmCQcd91As
         c3KIuqQP3Uehjj5HUtzyR8gc4Roq+hcfFcA6U5MclHrWsT+6T7VMSEMuKUMMsT2RuMXf
         rK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942583; x=1794547383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QgjUQIvs3qIFboQ8HXSfJd5nUrq2pq/h3iYL5W7cQ3Q=;
        b=CZw5x+v75YeCddve3h+o9KMI5Zk2eOZlGBlmgPY+F/zDzM3CS8zGfQKvkUy9Zsr0+I
         V62lqTMN5szjyexFTKPvpSaBjQrZmCvSBWihXMfGdirOLids0DVRpgiuvN64LTTVrLJs
         ylQ9SEB9me4ErKrqPauLJDfPSi2BgKS1IaRcMb9K2z8aphZTZy3GD9WQ9zVfdlfsPV+S
         wvwJTWRrM4RvRXyws+/3WaFqRxq9Zr35gndRGx13c4mHvT/F0wYnBg/SKbM19R7IuhaW
         wmL/hNm5uogS24SOhgFeKI8sh6WwYFuEy8NwzpG8mMNT9EJi/0SeEOzw+rTWFT4rK8mj
         MVag==
X-Forwarded-Encrypted: i=1; AKwUvBx6tjcyU0K8P1vOdAT8EdOm4j0phMfrLCf+Axkbk0FQdG/gOd5Ylg2g6kbcs1gD9wj7xjw71maj+RoR2A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+6pTDZGLcuFWX+fR5JpA6TYjUX6BzZ9ZQ/1YMhHOJkQHYj7gld
	o9DxhcHkY2kClfRF0/UAoiQado3cLsQ7/eEPt/VGl/bQXD5cOOJYKNkb
X-Gm-Gg: AYBFou1ZVaFxVKBuPKQ90JSYCSqmUfw60pg/4zEbtG+l9k3EXNA3r25Stb31twcwN2D
	dJpmVxp7p7qXyTsKbXgYvAHoT02KrhRvX1i6rP739mCpemWVRxvlhG4kL5CiJWdgxirmvz+fLKe
	MpS3OZ9N43/vHNxecNqdHbo8rEDdDgUDq8PhCUtWCipvuTNgv4tVBfZ/IgegQHa+zPzY3ym4qo7
	JNhNzE10hRrUtviZQxbByefOL/JXMDzbJNr9DtcL0C5OnLF9kfPoEJx+brC4YY9Too8WtAe0Nvo
	6qv8qYPoH3zC+f9AJpx9/xW4e2+WcGw8hd/KBLC8PuRxo06SEvWB14eF7BU+udTqg6ND+wRc1EB
	lXv49qVb8FuSMjic27W7gUwI9PSQmNH78BcDcY8XGkRLbyEfhaRTMikhhCJsnTizE8jtoU+i3vr
	+wmdXRKpTaCqO3H0wxyUE3rKlNMP7coWRZPqdi2ItQh5Q9Yvq01/GI1vih52qHdsdNxxRAcN/yn
	ft2jND3YYtGD2PDkKyc2uUmRt+3oRJfE/u2wQ3PBJxIamZkPoJtVQ/ntmYjW40KVfxcQSaqfBNN
	xF1ySlC6iTk0V5I+r7mjGe52OLNsn6CbEZHVD7K3t4szhzV4Ayk0kuleGaGldyThs6vr5A==
X-Received: by 2002:a05:6372:a80c:b0:3e2:7c10:d47a with SMTP id adf61e73a8af0-3ebb29acdabmr1525173637.15.1793942582911;
        Thu, 05 Nov 2026 21:23:02 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b35a9a216asm245356b3a.54.2026.11.05.21.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:23:02 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] ASoC: codecs: wcd-mbhc-v2: cancel button long-press work on deinit
Date: Fri,  6 Nov 2026 14:22:42 +0900
Message-ID: <20261106052242.2000264-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

wcd_mbhc_deinit() drains two of the three works embedded in struct
wcd_mbhc before freeing it - correct_plug_swch (via
wcd_cancel_hs_detect_plug()) and mbhc_plug_detect_work - but not the
button long-press delayed work mbhc_btn_dwork:

	mutex_lock(&mbhc->lock);
	wcd_cancel_hs_detect_plug(mbhc, &mbhc->correct_plug_swch);
	cancel_work_sync(&mbhc->mbhc_plug_detect_work);
	mutex_unlock(&mbhc->lock);

	kfree(mbhc);

mbhc_btn_dwork is armed from the button-press interrupt handler
wcd_mbhc_btn_press_handler() with a 400 ms delay:

	schedule_delayed_work(&mbhc->mbhc_btn_dwork, msecs_to_jiffies(400));

and its handler wcd_btn_long_press_fn() dereferences @mbhc
(container_of(), mbhc->current_plug, mbhc->jack).

wcd_mbhc_deinit() frees the MBHC interrupts first, which stops new work
from being queued, but free_irq() does not cancel a delayed work that was
already scheduled. If a button was pressed within ~400 ms of component
removal, mbhc_btn_dwork is still pending when kfree(mbhc) runs, so
wcd_btn_long_press_fn() later executes against freed memory
(use-after-free).

The asymmetry dates from the teardown rework in commit (CVE-2023-53842),
which added the correct_plug_swch/mbhc_plug_detect_work cancellation but
left mbhc_btn_dwork undrained.

Cancel mbhc_btn_dwork alongside the other works. Its handler does not take
mbhc->lock, so cancel_delayed_work_sync() is safe to call under the lock.

Found by code review; not runtime-reproduced (requires WCD codec hardware
and a button-press event racing component removal).

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 sound/soc/codecs/wcd-mbhc-v2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index 0000000..1111111 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -1624,6 +1624,7 @@ void wcd_mbhc_deinit(struct wcd_mbhc *mbhc)
 	mutex_lock(&mbhc->lock);
 	wcd_cancel_hs_detect_plug(mbhc,	&mbhc->correct_plug_swch);
 	cancel_work_sync(&mbhc->mbhc_plug_detect_work);
+	cancel_delayed_work_sync(&mbhc->mbhc_btn_dwork);
 	mutex_unlock(&mbhc->lock);

 	kfree(mbhc);
