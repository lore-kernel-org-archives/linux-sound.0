Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1A02E7F39;
	Tue, 23 Jun 2026 07:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782198151; cv=none; b=l1K+KJZVSwVVkYTJNi7N31UcjIYCmBfzsqrQEQi5T3NgSp+PDSqDaTsUKHdPFfqKUTUV7Svf2vrCz/76Kl6ovSgYSQcMQ2t752tDRvLUETMyRMSHk99yFZDElfOLib9Byc7QCPb++NUpAPSjWsWk0i0WS8JLjmim33kEktqAQcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782198151; c=relaxed/simple;
	bh=ZgXH+aCDWXar/8+anbPvu5vGqVHBhnWpBl8e9EnT6GY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n3EAlmcuCCzl8SvMagDeEXH7N3ph9Z4CIA+lXkdbKxqapw12eMyl5GBNcZyWqXbJGicMuNA0FQ6+ON4ESV3TxVHzIjs8GaLwKuLQPiUbwrI6fZyKPSM8J6kIPvAdwPZTaYS1+o/dQTWAJnRjVMqRaMCH+NCbs0KpooB+gfya8aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=f2Vr8R14; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="f2Vr8R14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1782198045;
	bh=LwFDhizuo2+Ik8+Y9y71yGttfQKl3HJtlleYl5W4Tg8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=f2Vr8R14E/6w8ahu7e9qcO1G2uFqrgibTtCzYP3xGMjJWrxbwMGHMsOGZq6Q/Tnz7
	 wtAcTB28lePcq679nXzDuhQVlaRFXjPAuMCYJ2yD2wpb/tZ3eSr14+D1SmjDAg89Wd
	 LfCa7TM3bweX65pa9eHVn3Npvsw9y0uMPAr8o2PQ=
X-QQ-mid: zesmtpgz4t1782198027t97f7c958
X-QQ-Originating-IP: K4HrqM9NJPvFIGR6trAEofPxRX96V0Z0Hx5XFKTP9aA=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Jun 2026 15:00:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9120168397622121029
EX-QQ-RecipientCnt: 10
From: raoxu <raoxu@uniontech.com>
To: perex@perex.cz
Cc: tiwai@suse.com,
	wangdicheng@kylinos.cn,
	cassiogabrielcontato@gmail.com,
	kees@kernel.org,
	gregkh@linuxfoundation.org,
	guanyulin@google.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH 1/3] ALSA: usb-audio: qcom: Free QMI handle
Date: Tue, 23 Jun 2026 15:00:23 +0800
Message-ID: <30D641147F438936+20260623070023.2533877-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OHfGufoZnzRG2wlVYur2HeP4CGzgonchNAw3WaFUggW6Fnoi+UBJL8XY
	N5Wh4qZ/JpIG1sY6VElQRD3XC/LpTUzP9kwj5W5sMfalTeJGo7G+0IcWeiOGA3JdZ95cYEi
	jAjYPPTf3l+En5EqiPUZfHHgnjGNgypolngrHSQmsoYLrTxQBhJ7bnsvA6Zy8VGVvVN9Kv4
	U+KKgdDtgjaNr2cVzqXqzkNPjZLn/1NsXzemxxMLZjm3PXRdnze2cCHXx/ismj76eHoWkj3
	PGlcPSLjsE32gPYbZzdc/UzZN+J0FxIcMeKEBbVeuE9cHVXjGsmaSF4xb/fe/wu7XO7qsU/
	plohogdoYFHrzadUq2mu8oITHSsWBi/iMpGwXsKdSTPo44kOPuw/s3f5RSuI5OG6/PvNYLD
	LinO49fPjroF/gvUk6f9KZSSDCwgoIBlrZldC/Mhy2cThXBaMepd7zjBs+dmo4U1WQK6PBt
	YEfeRz8voJ5XIygHVq0UyQHE9YO2ldO/I8QD28AULZLVjBIvW1ED1poZXHHitUW/jbaDnP2
	/ye/xzHERUxEAslOp7Zj2VmxlAlm2u7KgmgbO774DP5pOM5bOQ7oji4I9Bsp1lCJVjRNULE
	ppY7ad+ArWG0o/iHxYjwLOhTqVITSLMrX2wyCxM8X9e4dOZT4cdFlov5bv65Bbedyta1hJK
	SLD5NX4yQxT5SxbgmJCH3mwSPlh6eA8vk2my5u5AQszHgQKCRRk21obEGqheeSa6fr8dpAC
	aqtvslMZKxKvQqh8psLDJ6jl4djGzCR6ihAzoCRhq0qUa1SulhJo6zcevP2impt/+I23E6U
	H7Hjap4vkInbulb1CMTXuD+pdNu3JSlIdVisWNvW1jMxXgvL/8q56x1eJkbod26hlz66cb7
	p/XZy1E6M9v0uI+wnHRAgMnJ6/IXxJCnFnR+KXah5OjYkEQ9cRNfBBNPSUtKO8c5ExoAUl9
	OAEfCi+y3pSrck+OZPCaskbpDpaX6f6ecPxh0AXigSsmkaR+XPif9lJETZrUy0va1602Jfh
	rxC1WTck+wsHKOMxjtd6maKWLmXdCJwk1cS5qr6kU7mhdMO2kE
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

qc_usb_audio_probe() allocates svc->uaudio_svc_hdl separately from the
uaudio_qmi_svc object.

qmi_handle_release() releases the resources owned by an initialized QMI
handle, but does not free the memory containing the struct qmi_handle
itself. The probe error path and the remove path currently release the
handle and then free svc, losing the last pointer to the separately
allocated handle.

This leaks one struct qmi_handle on each affected probe unwind and on
each successful probe/remove cycle.

Free the handle after qmi_handle_release() in both paths.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 sound/usb/qcom/qc_audio_offload.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 3a586fd..e4bfd43 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1988,6 +1988,7 @@ static int qc_usb_audio_probe(struct auxiliary_device *auxdev,
 release_qmi:
 	qc_usb_audio_cleanup_qmi_dev();
 	qmi_handle_release(svc->uaudio_svc_hdl);
+	kfree(svc->uaudio_svc_hdl);
 free_svc:
 	kfree(svc);

@@ -2012,6 +2013,7 @@ static void qc_usb_audio_remove(struct auxiliary_device *auxdev)
 	qc_usb_audio_cleanup_qmi_dev();

 	qmi_handle_release(svc->uaudio_svc_hdl);
+	kfree(svc->uaudio_svc_hdl);
 	kfree(svc);
 	uaudio_svc = NULL;
 }
--
2.47.3
