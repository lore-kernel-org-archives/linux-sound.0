Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE766145A11
	for <linux-sound@vger.kernel.org>; Sun, 13 Oct 2024 16:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728838630; cv=none; b=iVjOC678UT15OZCthK0dCvi7/GCftPNBbMieEIdBR+cjGeBThyw/wBRiPH5cUsvZu4G89Swh6weNd0uaKeqwUDfZRJnsKjah2WACG35/JuPApcxcMhiHKI2+MblCta6OyKl9UXPo17cTtng2vnjUO1LpdnUZDuH11hkyAZR2KLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728838630; c=relaxed/simple;
	bh=soQE9U5tyG/VdGLCoY52x10XVAq4rfQYcf8IuehQA4k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=RxoIfCP7mJxRE3t4dfAQBUuh8T1ecSws1E616nx/jLotduJS2NxMYKCqMCPpMyRDPmEfCvI7SteGo3ZeAvCiJ+51dIiPhF01KwiFATEuOw4LPuuaf2tqJDN0WPMMeY+IH0VTk25ICe2tEFsmR6RhKkEHABrNIDeWhDN+ONVTxAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxaudiosystems.com; spf=pass smtp.mailfrom=linuxaudiosystems.com; dkim=pass (2048-bit key) header.d=linuxaudiosystems-com.20230601.gappssmtp.com header.i=@linuxaudiosystems-com.20230601.gappssmtp.com header.b=ZUIj0HvT; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxaudiosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxaudiosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linuxaudiosystems-com.20230601.gappssmtp.com header.i=@linuxaudiosystems-com.20230601.gappssmtp.com header.b="ZUIj0HvT"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e35f08e23eso12392917b3.2
        for <linux-sound@vger.kernel.org>; Sun, 13 Oct 2024 09:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxaudiosystems-com.20230601.gappssmtp.com; s=20230601; t=1728838628; x=1729443428; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SJ7q6HLPV5bCtcC+36R4IoXulpsesHuT4ja0WvoymTc=;
        b=ZUIj0HvTQjtKHyNrM8xtnRKHQ01/5AZYD0me2DXTmBH3fPChDKhs/quPKB8fAvccy3
         gdYpsJ3LWAZujlhnj0yMmuViqTw0y3w/xzmzk29OoAMptVA7HJ9PI95RfBnYssdEhfsc
         chjWYvQqIVFV81cPMoH9dsYO2Dh+YSGSdoBN/LBfXerJnFOapwwM95YukEHs112hjsxu
         4IyxTv8C838hr/ooN+rgslvW5B7ZOaAKbR3pK8FWipgZw7DsGy+N2+nGB2fsb4ViNTT2
         +QQJ3Adwwm+a0Dso9r/fhGP6Mz6H5o37TpAeVHsaFyy20JWAglU1xRwYiSNTFp5fJD5O
         gcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728838628; x=1729443428;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SJ7q6HLPV5bCtcC+36R4IoXulpsesHuT4ja0WvoymTc=;
        b=G50PcAEt/1Vc8zqR5yfLh6rlJV74Eni5/wIgt/dv27Q/+PlicRwLd8Noi9c6HyMDsk
         UcTtZn0r+f88af8SXCQZ2s1AXJY02gK5dMJ929w1BoEHuPvFgTayeHZJ2y/Ed9XkwGD0
         mrWxKUGL7Z4XeMCsQAe5TSv2yoWPqpjizzMJ2IVAhV1jezSu7gUIU8cZOHAxxyiO1BLo
         nSkF5oZdcOCEby9Y/5IIi2fC3S74RD2DjMof1utRWdgJEBt57kCQjQVf4Q+iHKViapyB
         Onbv530dagkiXz9hKfqoWzeSY8fWKNn9dy9PkZh7pmWtjLywiKOYJx1cdg2aEOzgVf27
         OpAQ==
X-Gm-Message-State: AOJu0YwPS7pi8M5Qkf/7tXE851A19dhlXVDWMvbHgPKtmqKJKmx1JBdl
	EHvjMJj1b9dgZ4vIBffkRo0k+pxVSSSZT2NTMpPVyJFwBUymqctnSmvH7zSKAoAzjgQiQQD4DKj
	eZfFGJGD5mKfCl04OO8193lfB6N9Rovehs4MQcruYM9hX+kKmOg==
X-Google-Smtp-Source: AGHT+IFnsRDqI1tispkFvbJ4cish9wu+sxvB9U5BOFUg3eux7OPpZotBPbEgP5ZMejw05oSn7eI8yd5dol7o98/MMpE=
X-Received: by 2002:a05:690c:f8c:b0:6e2:12e5:358b with SMTP id
 00721157ae682-6e3477bf1a8mr77352267b3.4.1728838627782; Sun, 13 Oct 2024
 09:57:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Paul Davis <paul@linuxaudiosystems.com>
Date: Sun, 13 Oct 2024 10:56:57 -0600
Message-ID: <CAFa_cKmDynOwheDU3gH2NMbj2eRAPEkLL+PP3zd4S5+enVK5Ag@mail.gmail.com>
Subject: something went wrong with USB iJack data in kernel 6.x
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I don't know where to start with this issue, but since I noticed it
trying to use a MIDI device, I thought I would start here. Advice on
where to take it would  be much appreciated.

High Level symptoms:

1. plugin in a Novation Lanchkey mk4 to (a) a system running kernel
6.x (b) a system running kernel 5.x
2. run aplaymidi -l or arecordmidi -l

  Results:
     (a) kernel 6.x: note the presence of two identical MIDI port
names for the device
     (b) kernel 5.x: note the presence of two differently named MIDI
ports for the device

Mid-level diagnosis:

Run lsusb -v on both kernels. For 5.x, note that the iJACK displays
include a string for the MIDI port name. For 6.x note that this string
is missing.

Working with devices bearing identical ports for multiple names ranges
from extremely difficult to impossible.

I have no idea what layer of the stack can be involved here, other
than that it is not hardware. I've run both 5.x and 6.x kernels on the
same system.
