Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793591579;
	b=N3C3L0CwjBOtosDVqWzDWmTzx4BeCu6ixB64Y5cjANVZAbOYoS2z2t6PX9hz7KyC6EQp
	 CRfIjuZgpqSKHQ4+Uzw0z2pHotvKjbVXeAupDo630JpAcxb/9ZgNYIAYEFQqkMNE5fnHa
	 yMW4BcueOPl0ngBhFykbcIlp8S8I9FNW9iL9ol8iG97ADeuSdWj39NLW3K/h1QdeDjrpi
	 jCGqWanjIkT5l2+uUD2qqT/C02ftDb6PTr5LTaxIHYdBfUsxVX3cyTyCCLG9cnXan5CjO
	 G5h7rio8X10XfOrne0mlu89/ObeDDi4RrmIyyKpavRznf+6r14VqvLpdBQbcaBEctdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793591579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GEgLVAromPaUrH1jitVPbv7vIRjTpekHb9MijwFJEpQ=;
	b=atYQPTmUAha4QTFkvDbCyyfG4aRhwfZMllCIuS8lO60N5Y1MJnaLWaBbJA3u0yW2gQqN
	 JOKfHwxP4thJYhq3y35sb1sWFWDR4Xyt9kD4FVFMdVHK+oub5ZMLtGmavhfbaBi7kLTRh
	 XUkqmbljM2zE7h29qXd2OjxlOdkGOJcPtw2cOlF3+NgsEfmez3nCHA+4Mj/8BNcvwJLZT
	 3PIW2B6XfbFjpvYVD5dpzyD6KHP1lpNiAKIs5osptEbqUsCZnk7XTgjS8DblOCvTeLdmb
	 KAQZBFGcMHpgRkBqS+RK98lEBesCeQ1D9pPM6ZnwOt0K85oLKh0xNCBVTDZrMs3frtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MWK818G;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9140E606A329
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 03:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9140E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0MWK818G
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e8b20a899fso16819565ad.1
        for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 19:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793591578; x=1794196378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GEgLVAromPaUrH1jitVPbv7vIRjTpekHb9MijwFJEpQ=;
        b=0MWK818Gv28nmlTZO12RnNRMhWyi8fhmOjVscQpXx2kRVjMDCPCCYP3SdiYSpuC5nS
         TdyNkGi10iE0/mH9ZaUN7V9IC+2sGF92ZZn2ClOlgB3IwitEfOVVu6Wq+Brh8QW35R15
         iEObQv7eQbKWb/IhUaQ7/TPyavQJodNOn1emrXPgD1XL1P7vJcD8ZQSyhlgH7mOJtwrq
         7ukFqIHqtIzvhT1GN+a3/5yefuvLScma8vNQV9B9X7FrWItWXfdYc+Y1nvDTSVvUKQgz
         JPNZrPZAGwZqavUPdIbenu0Oc33XFW9s4PVxNkmDxWrT2vhnI24F8iRPWdg+DOhMYZVs
         EcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793591578; x=1794196378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GEgLVAromPaUrH1jitVPbv7vIRjTpekHb9MijwFJEpQ=;
        b=O71RSUCdmtesEmhSdo+jbf6nRpTNCCi6RGkQKtWlG/+2k82U2/Ng2TR8q6cG+nUXfF
         5vPnucjMnUJoX06FN3EZYOR6XH/dxAEisaexkbuDfQOcpxdZ1dDSLRW9WwOI1M1DgjDd
         PCOYvYMVV84IIvoJr9vmihcTVfY0daQeqBufQQoICeVo49qTjxpmByyNouzc2Hj4Q7Ww
         gQRkrTjF07fohbtU8pxTFTkGSW8pjb48iK6nIJWqv5HsIF4wa7vPudxVp5u6kolxhriz
         uxdxZv3b1KGXbiYn1j7ZnMKe5rHgJh6XG42auB92eN8EggvPjl69kNI8+7cmAggCav6H
         kazw==
X-Forwarded-Encrypted: i=1; AKwUvBxA1cLVB1KvB5b/mq91JnITxW1TChf2ZrmWiIg+LaL/0TO49qVBKFOOLjJWY3QBr0mEZ1CcNUah4iyDMA==@vger.kernel.org
X-Gm-Message-State: APuU4Z//TErHb66utj3uFVXU8NLN8b8bHMssqyZNot8xAxFWJL9UFdly
	wp4WLcU6AglFaONtFMlUpQ5lZdlfIOU7oGuUDn1R0amfJ2jgpgvvSiXG
X-Gm-Gg: AYBFou0Mkg2BiGkJL6RCsw71xEQr+hnZCYvuLP0RT9V0K5fFZp3fE0XxIm4uN4s5Xcs
	T1EGeGtABjNOq2hpbbet3jz9o9xkAwsJpPxyxokxDc19I74UyahCbBXLO1JllDHwf8KFwsOZ0E4
	o5p7X4FjtxMpWtkQLrKwONn1Dyb6nf4mHsRg8McI4QpoUHXDXmxC6xlfDtiQLmvYQtW6v7whj81
	QrBkys0TB3zdVEAUgwbhHHfi1FOR7F+bMx/wz/4spx8Z2/EPTkDwcLsZe9zxoYpkLh8FHTvDQMU
	q7J7V52X1eaP0mezCtNaVRVF/7iDKUkHMq0Ds4jfuDGVPNaXyqrjQdCu62CPix3XjW27cfZFAkX
	X40Wr5joejKBfb7G8NF9ERgJ9cZaRjL0vxKjBXbV/s1c8AnLJ4vDjd2W5RibYFN/sUqDG5zywfv
	JaS1ED/9Tz815hrb3p+/hyTXDhUuaneIksklo8WF2qIdocmfP/cI65c/okdPQKP+iNQMYqPDcZN
	BYvQdghn2rm3QQsOM6T4vt5njkeK79thChyhafy5jLCRKN/SGydMItNvzO/qpHjEk5hwIpqa3Cg
	hZ2GTgkNb+4ozl0O3AePs2YCe2uIcXf3ffJvyXpwLlKwpADP4M7tuedmhh9xr+1Ll9A=
X-Received: by 2002:a17:90b:580d:b0:3ad:25f6:1dd0 with SMTP id 98e67ed59e1d1-3ae8970e5e9mr6935025a91.11.1793591577770;
        Sun, 01 Nov 2026 19:52:57 -0800 (PST)
Received: from localhost.localdomain ([2400:d802:dd7:8000:50b9:9b10:1e19:1f0a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae880b1f71sm6998814a91.4.2026.11.01.19.52.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 19:52:57 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: wesley.cheng@oss.qualcomm.com,
	raoxu@uniontech.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: qcom: Check the return value of qmi_handle_init()
Date: Mon,  2 Nov 2026 11:52:37 +0800
Message-ID: <20261102035237.56253-1-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
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

qc_usb_audio_probe() overwrites the return value of qmi_handle_init()
with that of qmi_add_server() without checking it. When
qmi_handle_init() fails, it has already freed the receive buffer and
destroyed the workqueue, and qmi->sock may hold an error pointer. If
QRTR is not available, qmi_handle_init() returns -EPROBE_DEFER and
qmi->sock is ERR_PTR(-EAFNOSUPPORT), so qmi_add_server() passes it to
kernel_sendmsg():

  BUG: unable to handle page fault for address: ffffffffffffffb7
  RIP: 0010:selinux_socket_sendmsg+0xa0/0x590
  Call Trace:
   security_socket_sendmsg+0x29/0x50
   __sock_sendmsg+0x43/0x150
   kernel_sendmsg+0xd6/0x180
   qmi_send_new_server+0x1b8/0x2b0
   qmi_add_server+0x165/0x200
   qc_usb_audio_probe+0xf4/0x2e0
   really_probe+0x2b4/0x850

Had the probe gone on, the error and remove paths would call
qmi_handle_release() on the half-initialized handle, which destroys the
workqueue and frees the receive buffer a second time.

Return the error from qmi_handle_init(), so that -EPROBE_DEFER defers
the probe, and check qmi_add_server() as well.

The bug was found with kbound, a static analysis prototype for
ownership mismatches at kernel interfaces, on v7.2.12; it is present in
mainline.

Build-tested with x86_64 and arm64 allmodconfig (W=1, sparse): no new
warnings. Run-tested on QEMU (x86_64, KVM) with KASAN and kmemleak, with
the driver built in and a test module that registers the
q6usb.qc-usb-audio-offload auxiliary device. Without QRTR, the probe
crashes as above without this patch; with it the device is deferred and
removing it again reports nothing. With QRTR the probe succeeds, and
removal reports nothing either.

Fixes: 326bbc348298 ("ALSA: usb-audio: qcom: Introduce QC USB SND offloading support")
Cc: stable@vger.kernel.org
Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
---

Notes:
    The bug was found with kbound, a research static analysis prototype.
    The patch, the changelog and the test setup were written with the help
    of an AI coding assistant (Claude); I have reviewed and tested them as
    described above.
    
    The runs were on mainline d135ab453a74; the code this patch touches is
    the same there and in sound for-linus, which it is based on.

 sound/usb/qcom/qc_audio_offload.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index e4bfd43a2488..5ee568e0454c 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1969,8 +1969,13 @@ static int qc_usb_audio_probe(struct auxiliary_device *auxdev,
 			      QMI_UAUDIO_STREAM_REQ_MSG_V01_MAX_MSG_LEN,
 			      &uaudio_svc_ops_options,
 			      &uaudio_stream_req_handlers);
+	if (ret)
+		goto free_qmi_hdl;
+
 	ret = qmi_add_server(svc->uaudio_svc_hdl, UAUDIO_STREAM_SERVICE_ID_V01,
 			     UAUDIO_STREAM_SERVICE_VERS_V01, 0);
+	if (ret)
+		goto release_qmi_hdl;
 
 	uaudio_svc = svc;
 
@@ -1987,7 +1992,9 @@ static int qc_usb_audio_probe(struct auxiliary_device *auxdev,
 
 release_qmi:
 	qc_usb_audio_cleanup_qmi_dev();
+release_qmi_hdl:
 	qmi_handle_release(svc->uaudio_svc_hdl);
+free_qmi_hdl:
 	kfree(svc->uaudio_svc_hdl);
 free_svc:
 	kfree(svc);

base-commit: 56abaa599bbbee5500e166ddb0b5241a00c1f763
-- 
2.53.0

