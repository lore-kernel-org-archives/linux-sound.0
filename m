Received: from mail-yx2-f0.google.com (mail-yx2-f0.google.com [74.125.224.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE89213D886
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 04:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789877627; cv=none; b=bY5qZ7EbBaJy6gwrDDywq3rE50Ip3/rRy5HF8xXtvkrFyh1jUVwvdzKivWp/0yCyQlhHcYrlF0AZzVufVfloCeQo9UbeGuXMCIcj+xFDjCD6z4/QZDRNuu0DYQlLbsjqg+AWjXcte0AqecQI1+J/aBm7P243kD/KinUYKyT47I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789877627; c=relaxed/simple;
	bh=0OVzIh+vsvtVC8UGyCseiAR3iEUCTny2s5Sp70SRs7E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GYlB1wSxy+gIvQAnY8F+bMlULXmP0Vt7rSCkMwUxyzJHB9LZm+Q//wteDC4XpWPXHug3UDlfnZarQ3q2yHOyNUNDQjDivXZO6lwBsCF+0v+bdis2RD4INlFJ3tIYUQHuyY/l/e0YpwAC9wb8lZrgXG0jLDKYa5N963JVOxArgCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lizi.moe; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lizi.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx2-f0.google.com with SMTP id 00721157ae682-8801bb7f4beso4793707b3.0
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 21:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789877625; x=1790482425;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0OVzIh+vsvtVC8UGyCseiAR3iEUCTny2s5Sp70SRs7E=;
        b=c6SQnAuDaGhtYniYjU3igp4yQDlCcaSkMUIvLEK7c/3uy2jOLwQK09B/vGsyki35cJ
         AsRgqDKdsP/Mvoa65U68lZs+k4R6eaffU/bOE+/q5HQRWU1MeDkKsg+ZOlmte9/y9l8A
         6fMF/DH8VnjmJz8FCfF2Ryaq/db8kD+rGnjhuUssdQvPkN6MC+26m3Ri68ktiFEHtaQM
         mKeFc5NGdEnPWKF/RshWhHZ4gQ43Bww1B13KBCaZOQWEhTzk1WHK+C6CUHBDxA/k2MGX
         8Xq6ZFykbtfG+JommGdtxUwX/kEy6EP5rq1Q3XRC3CAe+QLgA7CYIotNdSfI3PqjL6oU
         fLPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjM++riAT7RcXyzTR2bZkXwvRLEs/P7wKtS05vUtRl6MaIFBLzrMchPSEDsTcGKMmMUnwCUvlCbiA8MQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kSYAdocMpoAy9FN7Tvi3qFursIpJ/ae9vtIig8frlI8cILI4SN
	7VoDsGf+bbrqU2oSipKdIK+go5sv6z4hCbQFefcfzkbTmStO0quohTNdav9nM7s4lO05BA==
X-Gm-Gg: AYBFou12b4Ovg9FvIhna2UsdW+dntkQ/vyH4uSYqXH/IcU3v9gzOMNhXkQWVUQp896o
	fV40GULR/74gH0lRKCrYjWbW+JppUj11ppoTQK+ElnvjACsu2fb8TRLB3zT6R4Ed7/KiFh96dfw
	ErcRILW4lGDbJSq9SO3oiA9FYcePe+fScP8upb6Z9jWA2FuqDx+uTMLR3EcPI7SDrZBUwbPqYnR
	1dtX7iEp+PQL+duJ7ThmtPouYXLeD/UsgHv8SqemRggQcpatoSdUWebYQRgtq2YsdWIFH57sHXB
	lSuS2FKms3InhIicRwAvLXxuUFJWuz5tdQv9bdHWeJPwGmK07a3i1NtjdDjtc2vgVbnALmiCsLk
	+ghx8ncvQGErdW2wNmefehYEJMCcBettf7jehw9AqojXJfZEFePlH0+YWPMAvH2n371bzOlqjYd
	R0hg+19uivqmeVJCz5QTHywh0xysmDbokGIKojhVBnsoKMVtTUJdq/jZk5MTb0jQESk1juNVxQn
	9mZkhQie2PvnNoLAVyEjyS/lw==
X-Received: by 2002:a05:690c:39a:b0:873:5bd1:98b2 with SMTP id 00721157ae682-89736b375b1mr18129367b3.36.1789877624629;
        Sat, 19 Sep 2026 21:13:44 -0700 (PDT)
Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com. [74.125.224.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a478ff1fbsm14086937b3.31.2026.09.19.21.13.44
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 21:13:44 -0700 (PDT)
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-89666eea29cso13243897b3.2
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 21:13:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxdEW8L2sCCEDVA/PyAN5gJqPLMOYLKhzh5I6zVu56jnu5cHRjBATUCduv5B+w2Wu3g4S1JbYfotpL0zg==@vger.kernel.org
X-Received: by 2002:a05:690e:4881:20b0:66f:c1bc:87f5 with SMTP id
 956f58d0204a3-6717fdf309emr1366552d50.78.1789877624271; Sat, 19 Sep 2026
 21:13:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Hsing-hao Li <me@lizi.moe>
Date: Sun, 20 Sep 2026 12:13:33 +0800
X-Gmail-Original-Message-ID: <CAGFxjKKqxxmtkqEhPzQJg=XWTpom1RuwLQ7-OBCbuX7BynxVkA@mail.gmail.com>
X-Gm-Features: AcwNN1WdMdMhoKnEx_xLS2HGH0J4NT-96FKmTioQVZ9YXcH-svEmLRcrvRu3R5A
Message-ID: <CAGFxjKKqxxmtkqEhPzQJg=XWTpom1RuwLQ7-OBCbuX7BynxVkA@mail.gmail.com>
Subject: drm/msm/dp: d858770e86e7 backport to 6.12 on SC7180
To: kumar.singh@oss.qualcomm.com, lumag@kernel.org, srini@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I am investigating whether d858770e86e75bf78429b9f5210b7556ef431033
("drm/msm/dp: return 0 from audio_prepare when cable is disconnected")
should be backported to 6.12, and which adaptation is appropriate for
the older hw_params callback.

On my Lenovo Chromebook Duet 5 (Homestar, SC7180), running Debian
kernel 6.12.107+deb13-arm64 (Debian package 6.12.107-1), with
PipeWire 1.4.2 and WirePlumber 0.5.8, restarting
WirePlumber with DP disconnected reproducibly produces 20 failures
per restart. Four restarts were tested. Kprobes identify
the caller as WirePlumber and show -EINVAL returned by
dp_audio_hw_params and propagated through hdmi_codec_hw_params.
An instruction-offset probe, checked against the loaded module
build ID, confirms the !power_on branch in all 20 calls during
the final restart.

The observed impact here is failed disconnected-DP parameter probing
and repeated ASoC error messages. Internal speakers remain usable;
I have not reproduced the dummy-sink symptom described upstream.

In 6.12 the callback is hdmi_codec_ops.hw_params, before the LPASS CPU
DAI and component hw_params callbacks. Returning success therefore
allows those subsequent callbacks to run. In current upstream the
check is in the DRM bridge audio prepare path, following the generic
HDMI codec conversion in 98a8920e7b07.

Would an adaptation retaining the power_on early exit but
removing the EINVAL assignment be appropriate for the old callback,
or is any additional change needed for SC7180 LPASS?

I haven't yet built or booted a candidate backport. DP audio
playback and hotplug testing are also outstanding. The results above
describe reproduction on the unmodified kernel, not validation
of a fix.

AI assistance is involved in the source review, analysis and
polishing the message.
