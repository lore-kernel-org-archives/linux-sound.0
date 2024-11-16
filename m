Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0F13EA76
	for <linux-sound@vger.kernel.org>; Sat, 16 Nov 2024 15:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731771655; cv=none; b=SkpDziGGkBU6WM0/HX3krR7sQf9MjHC/kF4Gb50HKi5BovZXKiUZN0hgUjHGWoMxjlk4PSXXw9ZbOULwy2I5/azRAW/qNttujaXR288g5WXoCbZ9/uNSY1a5Oh/UJdveqrIFQ68EOpB1k8gDfCG5OC8de+xOnbVNj+L30Wa1Ikk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731771655; c=relaxed/simple;
	bh=Wd+7kLQISUZlzyPvYmSUTVOb8NV4Vyd3OpsFXw6X7a0=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=dp8VwctE6H9jje4c1tefIxSv04gLtWOvqlZOjl3GcPwdAwmcZWWMSTaHxiD5UPW1f9WYe9HWNkRCkaSqLj6ogOgcrdVx/RohJDUuUP+2BKj0d8ETJzIMEDJkFnSvuBeIr/LzosdqTWmDf03Rr44o1MkyK4DecmJDk9cljKVPcSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gl+pA24a; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gl+pA24a"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-720c2db824eso2541102b3a.0
        for <linux-sound@vger.kernel.org>; Sat, 16 Nov 2024 07:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731771653; x=1732376453; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=gl+pA24anTnI4had/C6pFYtn4cinDFk//M6gcukHSXBuV+t1strSEIq9sL9DJYjDeh
         +c+/DOVdPkTaERKhk8/E2zU9UdStr3DYCGnfURo4nF+usqoMU904B8NDeoMmCeEHFpBp
         2u+Wm0TcHLoUP3U6sWvDThc4fk4AgkzsFEzW1ypgMiO+M6JXvztNbKxIS5L9DA3DTaIf
         Sm9yatXibnnuQYXb2G+ZZeeAs9tfFJIYFSS3hbgu6vDSaBeiS2RAXe47YV5sjAeSbMzE
         yd7YNgpEmM8ktiQ8nio+TOGvr0sRVMYsToTuTPE+3L8tfxqnw+X1GogpooJFuyzmM67q
         GgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731771653; x=1732376453;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=HubauuByybW/xzfP6inaUVZwRlSt2PzTBr9w3ImxzuVzmlFnWri6zx62dUJ0bQpgiX
         TybVxLTTZRI4zkktlbFiVt7it5RIFwpb/mlMsFUwe4ULMVnSuAd4yT3cVa5KTtYM90ku
         XetZRy061KxhXr9/wagksozNBIRLpsZFpsbaGGU/YD9jlJXkN2USRIoOHNqgT14REwJw
         NEZuaeS55wPl5bRly1W9Npu53ziIfZNEkrz/jKqsRCsQssz/xI89NELQkyjo+6u9PY98
         goJdbOK226hpoBB1bhJr4j3cGieu2T8ZKfb1nnn+FTvm16sTHFkiHMZ2Jo/HL8CtQyFL
         RnPw==
X-Gm-Message-State: AOJu0Yxz+0LS4kmYsjwLBMLbYx+yUjexiApBnu//bWR1GyrZHerGcMBy
	992Y/ultBfGHFhWabfbXD8E5gcE5UbMSWfl8956AMEnNdV+MXC4ScO4arQ==
X-Google-Smtp-Source: AGHT+IHm0Mqr5FkFu9WfRvgNFtP/bzC4fOGrtR1XOOpuzoqjW8lUofdlYVdGDfQylpdfHJpGoJRJ0A==
X-Received: by 2002:a05:6a00:3a0c:b0:724:5b8b:421f with SMTP id d2e1a72fcca58-72476d58b29mr8483488b3a.24.1731771653060;
        Sat, 16 Nov 2024 07:40:53 -0800 (PST)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724770ee79csm3198933b3a.11.2024.11.16.07.40.52
        for <linux-sound@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Nov 2024 07:40:52 -0800 (PST)
From: "Van. HR" <skirotuh@gmail.com>
X-Google-Original-From: "Van. HR" <infodesk@information.com>
Message-ID: <d7c53bd48fd6c9eec149bb67d7f4fa00cf82dd62a8f51b219171fb72eb8fcb51@mx.google.com>
Reply-To: dirofdptvancollin@gmail.com
To: linux-sound@vger.kernel.org
Subject: Nov:16:24
Date: Sat, 16 Nov 2024 10:40:50 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,
I am a private investment consultant representing the interest of a multinational  conglomerate that wishes to place funds into a trust management portfolio.

Please indicate your interest for additional information.

Regards,

Van Collin.

