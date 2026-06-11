Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2D33EB109
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 13:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186256; cv=none; b=PY1ESzc5TigEoQd5ag00wo02CYFhAnmEze7R9OWketcU+/U0hVlTafrHvlPOsT9yid+mat7Rb7HFunYyk+y+g7y/IZVR0VacEAriMJx1yVgMiNmFfbly0ipMZNG9SiGO4M0IMR9mkGXJsjBmUsdDFjch2GJR42U+ua0/ldmpJVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186256; c=relaxed/simple;
	bh=aaPGmj/Rf2Cp0l5h39yLWteJOFFV2vfmnMxKUY+9z38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=puBrJ0+IZCRemTGdwnOh1PtHsrVihJIoCL45c9pvNI/yx9N+O4PJnNPOKvvtSZe9MjB+TDte2gF/rtR8Ad8pHqNHlPre3qDkNx+VhoUEvKvGVc1fGV7lyjY/sTv6Raop7Yax9K/vJutE9NZpac1Y2gHpQjPglEt1AbW/QrKibno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXtNF899; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXtNF899"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3042a388168so525426eec.1
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 06:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781186254; x=1781791054; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xk/igbRkiVHQISHAG80Zt7ftCue0/cepDpaFgqxdf7o=;
        b=mXtNF899U0NiQSSpp4koQmN3M/HbRBdL1NPPyxvhp7tl1Gnr/y/PFNbeCt35GISRDs
         ncXi8tVVpeQ80P50V1O0dGz6JkzeLgPvuNKGfJoxmG39BZf8GjmoMQWSHUCa2Q3kYkSZ
         D/wxQVyJRlh+l1z9MM3BwW9msEoCQ2LpfX5NMZ96TkLr7EAYH6gCGV8GzozL7XtPO2PE
         WB81SZlg8c153WLn1z0DDoFSNOPc4lYD7/bD+wxo+cq47gVTcYsjJaHQuHksaeFEBPV4
         LIpWbJ+RdMeBxH5WXfcr25gXQd35LKMlEqZxEOB/4j8BD0/Tjm94Mjqb8yDxA3BGHKKh
         UVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781186254; x=1781791054;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xk/igbRkiVHQISHAG80Zt7ftCue0/cepDpaFgqxdf7o=;
        b=JTW3OacCOD6mMXJm/Vn0qR4gLMICyR/3M4EVjX2sDk4FVkQO4J8YnC/SIoHaTVbTEw
         84dxwBF2t7biwoqkTjlKzZtkhK1AFkd/2SWlP/cJilpWdYVPo9v2UZ4QeIqx5YwjikC7
         /R+SLtjjWU0DObeXhFNtzX0gxyRlAHjSQpR6BiaFJSIQzHUPoTzDOnVswsbSReKNbuGB
         I3p0ftNHFanlHP/Uc18Pw14alHZjT/jtqLuLrk+mJSL1abBHP7S9klQaycNFlXxiJbCW
         003eorHx/I0jlTI9OmSZpuXin2chS3CYN4EEtkpTgtSyXWYkCS+nrx6Dy7odErVgvviX
         fxdw==
X-Gm-Message-State: AOJu0YzE/FEHbCfPDZ0yiLFtzDbJ3Gcmb5BEeQ+DtWStYKSc3u5XYoiT
	60ww1WWY46iUeAkN7OrMio0w+PfQPA9WXPZMbUNvcDjVDGTZpS2F8mtm
X-Gm-Gg: Acq92OH2yo1rfUZIEXOFMpW9OgsumQ43WBgjev9Djl7Vx012wWnT2QWeEgzV4xNDCNF
	0PY85CKJGwlPjbE6Viy3PQEaxOLYro5aWKVKJC8swmK2tE6NlbG1fj7yJohdEFHuzGguRpdxESS
	pY1iwt6on0MRzcaiKtHnrPPVlZMPnMrcaw/+b3i19HmcbX8vJRMNApf3a8O/UsaIcSbkC+OsAjU
	i6rnzZ8mQn23xGh9056ElmqJ5471vM/PVN2cyogkML2bZhmg8MN3ogXThbd+Fz5QdDfrDxiJSEN
	O/ARFhH2ulmveXivyugz9rzxw/3IPmlObEIAGuEgoxhZiE/VmvrukoC1BoiAQtMERrHV3ucWiJc
	QIA5oUz5VhD40zx7IfZrwqC1N+HxPY8ewXrBBUHonsDRZVwxX6zizp0rOTcBzXUqnsNmFnfoCax
	ceBHKtK+ulWD6QdoXmrwWSqiVYIuZMyFsjmevBcFK5ls0ODDUGejF+vbiBx/eyU2FyoIn0B3kML
	LnwY9WUm0zu
X-Received: by 2002:a05:7301:a88:b0:304:dc2c:3280 with SMTP id 5a478bee46e88-30805e73c50mr1678894eec.14.1781186249403;
        Thu, 11 Jun 2026 06:57:29 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30806c479cbsm2087097eec.9.2026.06.11.06.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 06:57:28 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 11 Jun 2026 10:57:22 -0300
Subject: [PATCH] ALSA: usb-audio: qcom: Guard sideband endpoint removal
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260611-alsa-usb-qcom-guard-sideband-endpoint-removal-v1-1-00e73787c156@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBBA0auQWTtJLVqiVzEupnTAMdBihxITw
 t1FXb7N/ysoZ2GFa7VC5kVUUtxxPFTQPij2jBJ2gzXWGWfOSIMSFvX4atOIfaEcUCWwpxiQY5i
 SxBkzj2mhAV1jyXVNV9enC+zNKXMn79/vdv9bi39yO38nsG0fF7Emu5EAAAA=
X-Change-ID: 20260605-alsa-usb-qcom-guard-sideband-endpoint-removal-672a6f7f3349
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mark Brown <broonie@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2097;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=aaPGmj/Rf2Cp0l5h39yLWteJOFFV2vfmnMxKUY+9z38=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFla+461Xmp/fipXmN9TKn2RvZtgjtCjRLMje9tMC1Yr8
 UyqiuPsKGVhEONikBVTZFmdtMhyT9eDq/VxKzxg5rAygQxh4OIUgIkcT2b4X2gjdE7/m+SJb4b/
 tjx44NyhfWqyx6k9G+f2LrxwxOL6Z3NGhgn8FRyVJapqHW4Pf33M3TwxNIMxlVvS0MCrcX74yeS
 N7AA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

qmi_stop_session() conditionally looks up the cached data and sync
endpoints, but removes each endpoint unconditionally.

The data endpoint is always present for an active offload stream, while
the sync endpoint is optional. When no sync endpoint exists, ep still
refers to the data endpoint and the code attempts to remove that endpoint
a second time. The current sideband implementation rejects the duplicate
removal, but the teardown path should not pass an unrelated endpoint for
an absent sync endpoint.

Only look up and remove an endpoint when its cached pipe exists, check the
lookup result, and clear the cached pipe after handling it. This matches
the normal stream-disable path.

Fixes: 326bbc348298 ("ALSA: usb-audio: qcom: Introduce QC USB SND offloading support")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
base-commit: 950425465c4e97d699fedb738ea6ffd456a40514
---
 sound/usb/qcom/qc_audio_offload.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index b2b719238b0b..a3f90cc7c6ca 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -794,15 +794,23 @@ static void qmi_stop_session(void)
 				continue;
 			}
 			/* Release XHCI endpoints */
-			if (info->data_ep_pipe)
+			if (info->data_ep_pipe) {
 				ep = usb_pipe_endpoint(uadev[pcm_card_num].udev,
 						       info->data_ep_pipe);
-			xhci_sideband_remove_endpoint(uadev[pcm_card_num].sb, ep);
+				if (ep)
+					xhci_sideband_remove_endpoint(uadev[pcm_card_num].sb,
+								      ep);
+				info->data_ep_pipe = 0;
+			}
 
-			if (info->sync_ep_pipe)
+			if (info->sync_ep_pipe) {
 				ep = usb_pipe_endpoint(uadev[pcm_card_num].udev,
 						       info->sync_ep_pipe);
-			xhci_sideband_remove_endpoint(uadev[pcm_card_num].sb, ep);
+				if (ep)
+					xhci_sideband_remove_endpoint(uadev[pcm_card_num].sb,
+								      ep);
+				info->sync_ep_pipe = 0;
+			}
 
 			disable_audio_stream(subs);
 		}



