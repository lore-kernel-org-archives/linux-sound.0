Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED882E2DE7
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 21:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754946716; cv=none; b=EavGsJFllpG690+BOsdOMWBBltFtMxnGQLiKxI3hJp0kUfcSp6TjCFMPXrWgbQpHzSrCb3Cr6VaqqN2alLG41nbKUR4lu3iKXFwSx8kCJFdiLUtfHa96qX2rbgPeu01OoBEu2OvF7xAxLdwFYOqE1gwfqh6u/cMwZG+4auZQcAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754946716; c=relaxed/simple;
	bh=gyiNqg71KNvV0mzfsizrVTbneghmnCo25ES1KlHPaWE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=k1EYC8SvNxlZvJef0y+E4OaGq6Jm07mNF8OwUJ4ZU0Qo2MFTE7x18heZgwRm/XOTzLmCylyBDQ+fn7XkFeDteGLGOkFBgKLxoI4y6hI3in+GfmRoLYVEofVQApBB3lSO0r5QEuz3l2VgIsuUDpJ8DEjTDLNYptRcyXdZCMyP4f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDB4ewr/; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDB4ewr/"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-af958127df5so725899666b.2
        for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 14:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754946713; x=1755551513; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=crFGH476/nFkI5BKrsA9hcicqHqNYtNFwSibrue6QPo=;
        b=ZDB4ewr/dD/ySeILDkknhnknzLr5ihdva5lfnOd1giaNT3Ou7kxpL8uZ+sV5DZKkMt
         ZbJ+6I/qpUqgkRyQZK/FQHKBhxxmmldu5m3EV2zWhWa1VVMMi4e65Gt0NM2iTlQC7H+i
         FuBOgm5lTuJrGz8N1suoJrang+X94j5okCiKJIJ+V3H3w8Ot58KTwMjTbuMhQwbo3ArG
         CHZ35UVkHxOolkdXv9E1XkBzgOX4EL6i+A04IQeZTB8TvBHUlu9t4H7k9+kiaJn4szpA
         1xgHuCMLBiIeAxgvpnhJ92iuf/ZUmqFCcqG45ej/hTcUNUFYO4KROTkv0y2aAOZq4EOa
         gVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754946713; x=1755551513;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=crFGH476/nFkI5BKrsA9hcicqHqNYtNFwSibrue6QPo=;
        b=wvFm2ZZqQ0En6nIeSEnMkbVDUNKWFwmr3gCY3xd3uosjfMCjescpfVwMu9TUqGMzBy
         drl4IK+cSOE06+meYU6vK+j0s5juLBDlucEwcUdUH+0+Ek/+FafCmp72sN/pkyY9UMP7
         bPzLm4fy56Dz5gGs/DB6DQ5qTKhXuiQVtXU/nB/JA+wrll6TfWhulkcgRgWE3NqpnKdK
         vbN/9cKpJyZwxB+A0lvuOS9oAhqqf9gl71VNPbW6UCfF1Xk4WAY6SMTPBHd4QyUaqoAc
         P1TkpMBGBs+KbZMajGXRW6+y4gGVXNS9z9gGHOY3GsptYWzocSE4WblHUd0WwUXxOURX
         zQdg==
X-Gm-Message-State: AOJu0Yzmv6Nsaw1oHuLH5q/lWhwz3toTcWE1+DSbla7MBLczQn200LSM
	IKRUEqHZ/et47yQOurmvMx73Qd2WlNjFxguyzRD2B8qrGO0b6qzBLn6omLBdQ36cQoXLxZyFq/7
	EqaGM79ykQxJjb7LNIyApwy3CqMLvewp+maUE
X-Gm-Gg: ASbGnctdy0QrmJH/uH1kR5YegcNjseJGFeI0zVBGzypDdYGzhSaGa7XHs5NJc1v4h53
	0VTqYJdIBuUKA4AODhEQQ14b6k/yfFzg2R5RPcTiSdAGAi8GbY6RHdMNLF8XdKWTH+WCw9xUpdX
	br6nCIZkp61ZvVFxD3YNukshhRBkMjKPtS9jbjn8SuMbGtLkJpzxc2XUVLl3AkTeZeTBWxKnnGV
	g6Hqus=
X-Google-Smtp-Source: AGHT+IGKKXIlhZmeeIgceccoWiU940KysIdKLIiEcNQ9iGpjjXM8cUCrqKwLKG3Grb/ghgS9vzYsiX2GN215SEph1i8=
X-Received: by 2002:a17:907:7296:b0:ae0:c355:2140 with SMTP id
 a640c23a62f3a-af9c6540fcfmr1481198366b.45.1754946712898; Mon, 11 Aug 2025
 14:11:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Fernando Garcia Corona <fgarcor@gmail.com>
Date: Mon, 11 Aug 2025 23:11:41 +0200
X-Gm-Features: Ac12FXwpZRd5ZYaj3e-_vmkjdZYklnrO1wTiwJir4e8NbGNq7hZwLQL0HVJYLHQ
Message-ID: <CAKmNvu2u3TkQPiEuz5R9_W3AGCUktYAoZET5BZi1vvhxBXd2BA@mail.gmail.com>
Subject: [PATCH] Fix audio woofers for Lenovo Yoga Pro 7i Gen10 14IAH10
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Linux sound maintainers,
As reported by other similar laptop models, the audio on this laptop
with the latest stable kernel
Linux fedora 6.15.9-201.fc42.x86_64
only reproduces sound via the tweeters. That is because the woofers
seem not to be active, similarly to what happens to other models..

The fix that works is adding the following configuration to the
/etc/modprobe.d/snd.conf to load the following quirk:
options snd-sof-intel-hda-generic hda_model=alc287-yoga9-bass-spk-pin

Here is the detailed info of the laptop:

alsa-info.sh --no-upload --output ./X 2>/dev/null 1>&2  ; grep -A4
"Manufac" ./X ; grep 17aa ./X
Manufacturer:      LENOVO
Product Name:      83KF
Product Version:   Yoga Pro 7 14IAH10
Firmware Version:  QGCN28WW
System SKU:        LENOVO_MT_83KF_BU_idea_FM_Yoga Pro 7 14IAH10
Subsystem: Lenovo Device [17aa:3844]
Subsystem Id: 0x17aa3911
  Components : 'HDA:8086281d,80860101,00100000
HDA:10ec0287,17aa3911,00100002 cfg-dmics:4 iec61937-pcm:5,4,3'

Could you help adding the quirk for this model?

BR,
Fernando Garcia
