Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943903;
	b=3zvVAtHfKrxNq7Oolyhg/ITJUnz3xQzoFLo8cgPCbUKNFP/YXNNuJ/MMGTorSJOGSbHS
	 TF3/FJEWAXM8XNtmZcaf8ckZWLo18jxlAGS+bJ6wF9d88iS2N+GEr5eTV/ekQZ91CJanf
	 kxCnvyWJ+e8xo3oz0PgDBwW0ghi8bUslfmsaHVD2w0oNdYNGT2j7FeXDNyXjC7CKFBGzy
	 ttwF7iVDfpB+FsvVKlc4iBkwpsdq4eNNwBjrtAz4nO+89L4eSFszQKdG7zZbR9JipGEUh
	 0EjORCybKq0RaXTeltEBkiKDpSygq4+P0KgcAsV11hcfZH9wNNLW0GaVq98KOo7NtAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aICijDd7xJCkTfq11nR+yzRU5122aZYdbxC4LCJRnpg=;
	b=rchMcEp+1wmsJl9ANXLAX7zlVg5IegeflyX/69Y4Dv8Xm1EP5DbrGommuJOXR6lRx/7L
	 KAqDEn8nNuX8u6TrP3cSsrmE72WjjmBZh8I3l4A8dLTsdqpDaCODIoqBvMiR5Dpn76J0v
	 Ghd69UOKOollo8CZjsfgonvd5Ut/Z7+D/0NdkuXzU6DpuOiyuQqeIY1aew5h1tVAWMi89
	 0q8h138NKFMfRAeWS0mOaOuHYzFugRrKkfO3Inv1Ap8j85XBQXmhYPezrEOjmV/A9Xkc9
	 +6gMmcRsPoFDhlw4qbBr2gRkUZSBPVpV0UMNTk5JeyZY/oPq1YYF8UR5OMMPl7kV8kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A+XTIMuZ;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A9B606A33D
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 05:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6A9B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A+XTIMuZ
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ed408b0d9dso925395ad.2
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 21:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793943902; x=1794548702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aICijDd7xJCkTfq11nR+yzRU5122aZYdbxC4LCJRnpg=;
        b=A+XTIMuZOsIXKHhMFKxs1APRslKsJq7nlr359txDUw7lVA7nympWDlULP9Pky2QaK+
         gpxqaN1ViX9e89SK+OIS6sywgsBbbSRJ58QWnprFSVME7mDSKOkYa75dCgcLC4r0RyYT
         5b9fSjfsINPBwj6CnsyNsAa2G7GV73PWySJRGcHfOonm3vttkntn/2BGxZVQZzi7TBOA
         yFdtzBQw8DSGwEYxrmk4P4zRzNch1ZqqjIpzBU0BMWOc9oUjV0BaQHqV0McBVYWxsnSo
         qdPojH6jFSK8SCNEcp3LmEuecxB2Csw62Oo+F+0JL73/N1eodJwHgh26Yeco9K3V4bZR
         EbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793943902; x=1794548702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aICijDd7xJCkTfq11nR+yzRU5122aZYdbxC4LCJRnpg=;
        b=mPI0/CR74BJXnJJpu5pxcpEaSBu3ldyBL+xtAvl69QccO+BL4S6tp1SfdXMXjYUAXk
         4ZZHkPoJw12njfwrJF0xBh8lcblo1C3gqQimObieHx7YR36PUaIQ6forv/ymGdcv5boy
         XmqnjExiqOtdwKw00ir9XyvAF9ULusgOp4SHq98nQ4fY3vNWjT6MdB2ZCJ/WUbTL6laC
         fFaPxRf2jR3lyX209o7qFv00KRk68blYjcKDjw3eBf9btAdhB0rfU9LdTDez323d8pOV
         VydTZE16ij1ATRTxPe5UrdaKFGG+ypo2/vjNieDydzUd/QlFwjPJ+R3ovhjssN12mYyc
         V34Q==
X-Forwarded-Encrypted: i=1; AL+hErHiCxNSg5QeKZ7PZGrZ3csKe9h+HosfrynlLA3EWnyxrgu8piAGcBRq/8JD/WStQGxpaToZghgP8xzzqg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9jdYaQeWEymEz7P0S/xfYoQqTDljAkNGoxJ7uLJ/HuoQbI4VfM
	YMKawgpg5eQIaq/jjyDYro4V4EQ9dhJmMSqt/GTwfiQ9a2Hggrc+Mxyh
X-Gm-Gg: AYBFou2k9R97ONAJMh3EudivGHImT9EGNxO+srSY/h0EqElq1uObZhVUyj07xxXEqu2
	MaySd9Z8qAXTvpBhQQcWh3W+JMGo2vdv6r+Tfi56d4Lm8q8DUkKUlNPz6eMOfOh3N08uvfgqLFy
	y5Oq1aaSP9aEqipB6NDGKevNMQ6Kuqy+g3rxmAdN0KfI9fFhzuc9SzH1o2AYtzv38Go4Xlu89bC
	fZ1W6cxp4L28WvTH6UCbwb042MOc/aQl8mT03wje0tT5/1Z3ByLcASqUgfUv9x8hwcgNzR+T08G
	S143qcYO1TjVH1TLi2AcsJDdlyTPd7l2xXP+xDeC1G3xu6FesU9j7FQPo4Zz4MFnG7NN2ixdQjv
	inJ7Ke/YfsYo3HmJlALKz67wsXhw63UZ1DXesj52F9mAcwJe1DSS/hR21pf2wDpnT2XLI3twlcN
	mjVVC+LlBwo/mAXAlxtZMLFm8XFSE/OVUuuPVgP/1mkv3L5MxIvHuJsfqhF8PqGRcqO1Fs1wXRA
	AvV53/g1PZ8KoO3LnQyJly2rBRc1VGIAe+zFUGC0B7DpxAKR6jhXiHFkLoMnrQMRYbX1f24dXgj
	WvNgkbO5YJWS/BYXXxJDdBnBuVHgxTqqDxM13cvvYNmRQbU/
X-Received: by 2002:a17:902:cf03:b0:2e9:7190:32e3 with SMTP id d9443c01a7336-2ed41bf64cdmr19435685ad.38.1793943901959;
        Thu, 05 Nov 2026 21:45:01 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d5f7cfsm1756635ad.48.2026.11.05.21.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:45:01 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] ASoC: codecs: wcd-mbhc-v2: cancel button long-press work on deinit
Date: Fri,  6 Nov 2026 14:44:47 +0900
Message-ID: <20261106054447.2019214-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106052242.2000264-1-hj351016@gmail.com>
References: <20261106052242.2000264-1-hj351016@gmail.com>
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

The freeing of mbhc was introduced by commit a5475829adcc ("ASoC: codecs:
wcd-mbhc-v2: fix resource leaks on component remove"), which switched mbhc
to kzalloc() and added the kfree(mbhc) above; the deinit path cancels
correct_plug_swch (added with the multi-button support in 0e5c9e7ff899)
and, later, mbhc_plug_detect_work (added in 0c105997eefd), but
mbhc_btn_dwork has never been cancelled there.

Use the existing wcd_mbhc_cancel_pending_work() helper, which cancels
mbhc_btn_dwork (via wcd_cancel_btn_work()) and then correct_plug_swch,
matching the other cancellation sites in this file and ensuring
mbhc_btn_dwork is cancelled before wcd_cancel_hs_detect_plug() briefly
drops mbhc->lock.

Found by code review; not runtime-reproduced (requires WCD codec hardware
and a button-press event racing component removal).

Fixes: a5475829adcc ("ASoC: codecs: wcd-mbhc-v2: fix resource leaks on component remove")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v2:
 - Use the existing wcd_mbhc_cancel_pending_work() helper instead of an
   open-coded cancel_delayed_work_sync(), per review - it cancels
   mbhc_btn_dwork before wcd_cancel_hs_detect_plug() drops the lock and
   matches the other cancellation sites.
 - Add Fixes: tag and correct the commit history in the changelog (the v1
   reference to CVE-2023-53842 was inaccurate), per review.

 sound/soc/codecs/wcd-mbhc-v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -1623,7 +1623,7 @@ void wcd_mbhc_deinit(struct wcd_mbhc *mbhc)
 	free_irq(mbhc->intr_ids->mbhc_sw_intr, mbhc);

 	mutex_lock(&mbhc->lock);
-	wcd_cancel_hs_detect_plug(mbhc,	&mbhc->correct_plug_swch);
+	wcd_mbhc_cancel_pending_work(mbhc);
 	cancel_work_sync(&mbhc->mbhc_plug_detect_work);
 	mutex_unlock(&mbhc->lock);

