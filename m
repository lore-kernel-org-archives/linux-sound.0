Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998E378F4F
	for <linux-sound@vger.kernel.org>; Sat, 21 Mar 2026 23:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774134150; cv=none; b=iLBgsu9d6fvwEkfYWrvigThyLAb3HT6g6773guapDpF7c1YolaJU0mplX7yhFFqEmo2WvorSL9U4ItecOSYS2BYkVsLbgq8old5MM5BtEneiqvAg5voKuttFkx6kRfTC/TFej/cLmYoMFDiURQ+0OFsbkCPVpwR4HCYwIin3Ii4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774134150; c=relaxed/simple;
	bh=asCbfiwHcURsQql6KGIGtCkicOMZ3bUpn7t+3APd7w0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JTUG+0Cw0gUIIncpFq5aNOIrx975V59k86tlSQDzPnAyZmHELmqu3Ym3FkfcXQjc+93+wFXeErYRoE3Lczc+2QbSWr1oJOJwshSIs70nyAexPBBxRzWQ3ekfU0ZK23PJVbarWdcuMUorvlVSSQdumkGe/jReq9QyjzenEY9eus8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6SfDOD7; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6SfDOD7"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso935556e0c.0
        for <linux-sound@vger.kernel.org>; Sat, 21 Mar 2026 16:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774134148; x=1774738948; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6rA9j2SRuXsEO8QjqC2/UcbuMYb8N8ZP0G/6hW+sEcY=;
        b=H6SfDOD72JSOdxGyV/EPQnZh2d9Fln7EsYENwOQpHxxX9un7mYC0xloDzLhCiDYeUv
         8nsOrob0BccL5pM7oTMnQcim6XMG/k0E63+qIx+ZFgR7K+o+nrDEFT1MsrQB0yH08icg
         cdLGeBJUye/LIuygQu7vQ8/fN7gTCMei1JnuN9wpA9IVmmgxSqu02pmNqV78AHgfwrBb
         UnbWMSv4RIfwpP6+/YnJABVKc3wuiiKAm/EqX5XDPrn3M5GEQ8vTHYSCPajByO/eW61x
         yT3LIDVRW42OiwWJcEawYmjf5G9GFh9+jqYtDhxuE5J3HlpwtgY0L/kd7HJ0+PTQRJu4
         xZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774134148; x=1774738948;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rA9j2SRuXsEO8QjqC2/UcbuMYb8N8ZP0G/6hW+sEcY=;
        b=tDAAcrNA4uGKFjjvoqux5wuEyYoYbmtLFvbSV22uN9liI6oZkkev8N+0e6v70t9hCn
         XGmI3NUNY7eZyyCmbxSosRfznBBYmBuCvsYiWkUkX24tI2fdl4LAghnVSIjP2u1YXMlr
         pGKSB+psh6zr0Y2BI43qEvQF8AhEwbq4xRXM+sHHUX4GPF22z79twM5DjoePyFitpMM6
         469LN+OnYucKhSBSThof65tVkKFOMpsWObtKR9sEsGvYJLfRHpfciD4AN+Lz3mFaNmDg
         vCPymHRwI3WwtXHe32CkHcEdAUEli0vJ0eE+X9ZV5KNj1zzIOfHFZQxvBxZQgeMMH39t
         8U3w==
X-Forwarded-Encrypted: i=1; AJvYcCVJoCUeYrM/mbSblvFpUeEJDrgvw84IvwYoy/qfJpm0ZPSt0UckZcKZzyrM3dUW/sv2amQHWmbHegejIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1YZIyOBuvFhHVSb4j9AaB3XblwJZqpyNRccGfm67zjEcoLrjQ
	k1KoomuD78omdFNZEEmCz05DJkOg5SV6xLaO0xPMplvAxnZ4j2uReoJxDuY6Vjag
X-Gm-Gg: ATEYQzxXSMV24mDxwYJbbiPzyOVm9Cu2IWOpEJqUCDPC572BiCWRLzDCR76hNjxItzy
	XSGSKGtks82sPBv5mS0lMBtqTm6T/4AhyYkC4Bu5KlNVBddpuyB2XLXxOvnavU50yreqfHtF3W0
	ED/uDPulOussdWQKhnP9Eywb3ZuQi5h2qcz2Rt/Ma6T0Gau2W6SgFKpuGbBx1U9poFlnDiFysKt
	bZzgpUP14Yo3Ab+Nu1P1l/dJ8SqFN2F9GuaMG6eWIHDb0t/pfY8gkP15JBt7WEUGJj447CFidYV
	oh0N4Rj8XeE4tw7s8KGQ2PH3F1D9qd6FLMNqiwzgJybJVFVEjh1UtBVtXQxcwdmkZgqPMtfAynz
	RXwScswf942WjEqHrf23wne/v5m0Nbur0Cj/T4q9Apl9WlEl8I7JoyZ6XSGPvYDxxMmbr9Pd7E4
	HP99JFPxhXMMhtFtOxKpz5czKkL5lplYXZsWt/OWtidA==
X-Received: by 2002:a05:6102:508b:b0:602:ab63:b0ca with SMTP id ada2fe7eead31-602aea8f560mr3132648137.1.1774134148505;
        Sat, 21 Mar 2026 16:02:28 -0700 (PDT)
Received: from [192.168.2.36] ([2804:984:80c:b000:ea0d:627b:10e6:d9a6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95136e48debsm4336905241.13.2026.03.21.16.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 16:02:28 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Sat, 21 Mar 2026 20:02:21 -0300
Subject: [PATCH] ALSA: pcm: Use pcm_lib_apply_appl_ptr() in x32 sync_ptr
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260321-alsa-pcm-x32-sync-ptr-v1-1-02ce655657c6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqEMAxA0atI1hPQqEW8isyi1qgBraUZhop4d
 4vLt/j/AuUorNAXF0T+i8rhM6pPAW61fmGUKRuoJFPWVKHd1GJwO6aaUE/vMPwiGtN2ozPUNh1
 BbkPkWdL7Hb73/QBL9l1sZwAAAA==
X-Change-ID: 20260321-alsa-pcm-x32-sync-ptr-6658bc625482
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1967;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=asCbfiwHcURsQql6KGIGtCkicOMZ3bUpn7t+3APd7w0=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJn7lRtlN8xT81Z/H6y3WNm2/5C7GwOj/OYeu8QLO6KmT
 NmsVjq5o5SFQYyLQVZMkWV10iLLPV0PrtbHrfCAmcPKBDKEgYtTACayzJORYZHCmd7s6k0sN242
 dcy4ZsHVVXSZM32Hm2Ngolzgtflu8Qz//X8c/V0hfas8pk9d9c6R1XZ7f3qFXZ7A/uY+0yJxh+f
 3OQA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

snd_pcm_ioctl_sync_ptr_x32() still handles incoming appl_ptr updates
differently from the other SYNC_PTR paths. The native handler and the
32-bit compat handler both pass appl_ptr through pcm_lib_apply_appl_ptr(),
but the x32 handler still writes control->appl_ptr directly.

That direct assignment skips the common appl_ptr validation against
runtime->boundary and also bypasses the substream ack() callback.
This makes the x32 ioctl path behave differently from the native and
compat32 cases, and it can miss the driver notification that explicit
appl_ptr synchronization relies on.

Use pcm_lib_apply_appl_ptr() for x32 too, so appl_ptr updates are
validated consistently and drivers relying on ack() notifications
see the same behavior.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/core/pcm_compat.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index e71f393d3b01..5313f50f17da 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -430,11 +430,13 @@ static int snd_pcm_ioctl_sync_ptr_x32(struct snd_pcm_substream *substream,
 	if (!boundary)
 		boundary = 0x7fffffff;
 	scoped_guard(pcm_stream_lock_irq, substream) {
-		/* FIXME: we should consider the boundary for the sync from app */
-		if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL))
-			control->appl_ptr = scontrol.appl_ptr;
-		else
+		if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL)) {
+			err = pcm_lib_apply_appl_ptr(substream, scontrol.appl_ptr);
+			if (err < 0)
+				return err;
+		} else {
 			scontrol.appl_ptr = control->appl_ptr % boundary;
+		}
 		if (!(sflags & SNDRV_PCM_SYNC_PTR_AVAIL_MIN))
 			control->avail_min = scontrol.avail_min;
 		else

---
base-commit: b3c48fa1fb397b490101785ddd87caf2e5513a66
change-id: 20260321-alsa-pcm-x32-sync-ptr-6658bc625482

Best regards,
-- 
Cássio Gabriel <cassiogabrielcontato@gmail.com>

