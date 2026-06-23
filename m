Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7C93C4161;
	Tue, 23 Jun 2026 07:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782198852; cv=none; b=W0ajKynzOksDpd2UhdsHfJ3BUDNWjYB+pz4XoPuXO+2K90EnZe3OppxY9idlHJyydx4jtGEflKJB63oUZaV6IL5AjprzsJSi4cw4IzfvSoM4ZoLZt//IucegnM2Kxo+SzBMk/6CDWTXKmeMIdBL1nk433oB3/FN1+mV8hu1ud1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782198852; c=relaxed/simple;
	bh=EcLcK4dIYWtgXf2HtZAEyr+bUN1NWKljqV7ti9HeKD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BljDJOaKi6xR73ZRBvhUnugUoh1GQ7MMQvFZpzZg8Z4cmxfVvLnhonXd1fbIeDeA0voLhONtXcLSY3eHBysFVTun08TZ/E4ZIWsW6gQ2M5aC4Q8XxRfG6rddRB0QIx0HtMRqvfITu9DWEj3rUHFwhNHbNr+76mq7gggt/luYLZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=JlKUlRhO; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="JlKUlRhO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1782198796;
	bh=OOOX4IdnzL5+NaQ8WKpPYzBE7qpcRsguu7SiqddTdLo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=JlKUlRhOlDPORLi8TzAWJxBARilbB/sPv7W1w8A6aRNTnk/8dQs7W5BqItdcwa5xE
	 f5cgJhSHpfCX9RsMYsxQ6UY+xoE2uG6Eu7UHTDvlz7wmZWR1c2+Ewwprx3jrhPehbb
	 pnKuTZo75gnicoRcHicIEuVyAoXrXQ7g5XScCaOs=
X-QQ-mid: esmtpgz15t1782198791tc23560ea
X-QQ-Originating-IP: fiTGSepmScylx8eYzHbEUlh7MCnoo0Qw8yL+cShU6cY=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Jun 2026 15:13:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10345933106261499510
EX-QQ-RecipientCnt: 9
From: raoxu <raoxu@uniontech.com>
To: perex@perex.cz
Cc: tiwai@suse.com,
	wangdicheng@kylinos.cn,
	cassiogabrielcontato@gmail.com,
	kees@kernel.org,
	guanyulin@google.com,
	raoxu@uniontech.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: usb-audio: qcom: Free QMI handle
Date: Tue, 23 Jun 2026 15:13:08 +0800
Message-ID: <9108EC860F3F87DF+20260623071308.2549182-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MJ+1k5A5PRMjzmD+5nLLyXsWfKuaLfFum6VszQlpQamOediiVsp4KEVt
	llSRqEP3xfuSJ5F8q4/C3+Tl6vT8k91Qh3Y2yj65zmGGcN4iKt8Tscw5rMvAgO54FZi8nBF
	n5ZxomihWHafPUo9xuMQUvOyVdE+hCcM81Ni0JE0Ssqu6RJTjXdwtzxGB37X/hi4ETTnaVe
	HgBMSklMkTbaqPoG3m9cIfaq9Sea9uU/L3rXwmFSruXP5BCMcRhdrU1ic1hWunkdLcolZfc
	sOFxekrki0Hn3K1U51Rt5InhbU+etgLrdzEL4BAyfP16tkodwth4kY+dQMUPTzqAmDGNe2H
	HDw+xT80wPJQxzFCZBXNULUwsnoViO7VXFtRmyNtQ1YKYniErnHiV+eGRESrQ2Cntr6jtbZ
	3/ugdX9miHID9l94JisDjEiUP1h+98ZrSqQhkUACSKRtYnQ2eqr99enP/k5rEtZ9iGwmfYB
	iHLEv5GydIdxFLEoLqgGqQVkO4vBJ3L7uClZZyD69BXECIXVsRY5H7qFos2D72rLGraKX+4
	5hU2UY/yqJNbD6WUnh7gHcvNPLOfcqA/UBGAEGSK6JSvyIsVH0cXsJpWiNumhvmpP62YIZY
	l0jTAG2Cf433+Kxj+BegI/TbQffHsKXkR1Puuersh0E9SzOcWPP0hpmM3fHnVCWlHSsFs44
	Z7Tk8mswStTsTnNSkwilEFypOCN47vvCUMCBUwO2mNEA4hddpCSeex5b8mmx04qZ2hrr+sJ
	Q8Xcacmox6uKZb1veSYk1Q/fItch9Of0Z1RTPCER+G1DIifa4CNmNTI3Mbt5Uj1oA7wc1DA
	9tJaXdyV+1VpunP1fD/1qkZEkr6IRF5f7+w4VLe/JTykGcLozvM/LeKFANarUIygA59MaIE
	hXlM+D57ft6XcMPPqd0WtjB5zTpRK+cstxMjODNaqC46t5qG8V2wPFcrmg2BnF9qcb1s8ar
	G/kqqUrPm65yhKvhbH1LNCwTVZuotqDOr1Y8X/WOKRzAx6Vrm611NfdCxk+Gu9gZgmMfkto
	uQZW+v7xUABTvtY+7KCf3BWdm2EioN6r60Zv/dtsWIj/4lvPHmMzsz6l2FFmbks/wa4ULjv
	Ae56ap/hkn1xAQYnkDM8LCLFhkcSFe3WA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
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
Changes in v2:
- Fix the subject prefix for a single patch.

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
