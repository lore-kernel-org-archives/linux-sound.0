Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E34B2500AA
	for <linux-sound@vger.kernel.org>; Sun, 24 Nov 2024 21:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732483144; cv=none; b=JNUoHWJyGHyVnNEaHWF1KfaD5mOfWNdg/S1Rg1IkchFrrIZTJcRQxpOsR0p5zetClMenZ331IDKpySHDh1rs7XwU1Q3+oSh94bqj/kMmqKGPrgJ1xsdaAr3REhfh4H98YMaBIuXO3tHfOoHsoDcqYNuMEEhbYIRwwkh7mZgBek0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732483144; c=relaxed/simple;
	bh=EO/exgmecBAuRWLplEHwCmEZjJz4CpWjMlm1HGG3gjI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=QroC6MxOxQ1YIu2MNxXfU0oVaYKekQCDscG2qHriNMVQMID3VqipHCg8kRG/PCUCmg5CuijYqyDLajPGmO7Wo0kCRmoQzeJ3Yqnpd2a7xFMV1ArDewiSYvK4qd0cSWGWRvcJcpIEyBsDSsEL5DTABXAq0TNMB05V09230MF88F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=priesol.net; spf=pass smtp.mailfrom=priesol.net; dkim=pass (1024-bit key) header.d=priesol.net header.i=@priesol.net header.b=P+FCmPGQ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=priesol.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=priesol.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=priesol.net header.i=@priesol.net header.b="P+FCmPGQ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa545dc7105so127524266b.3
        for <linux-sound@vger.kernel.org>; Sun, 24 Nov 2024 13:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=priesol.net; s=google; t=1732483139; x=1733087939; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qVVfto2cOjwN9n4P9auaPob9G3a6sJmWCkRm7KWNnrY=;
        b=P+FCmPGQK1eQKKzQxmyTYTx7FSImfJaSSR6B68IbFN27dbLjNbnOAQHsyo/DRzLk6Z
         g4X8/B3bt+JAN5JJoC4BzEIcZhBfgxF2qZ1KJ8I4G+XCWorKZwtfeCGRbNTt+Y25JIJl
         znQFQ9RZgvtfivb2+uNUKZpaSbKedQlfAB5Ao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732483139; x=1733087939;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qVVfto2cOjwN9n4P9auaPob9G3a6sJmWCkRm7KWNnrY=;
        b=XvR1TdNbYxuQ2RXQ4k5LDgB+to2Wj9tskakZVLedM8+EVit/KgeOAldfmDxS+fF4cy
         x8+YOMPmjsbcL/a0F3jS88AP+PB/iFQP5uPsfKo4JztVIQ/x0is/FhlXJ5m+QEfc8coY
         TaY7xbo6zfbZdBCGIhtPwZQeEMLS4KJDtgOA78WVwE/t2WGinNvoi7B8U5dmOiKxQI28
         W/BNJkOXYZ+ab1McBVm+B7rNbeKOhu+t1BRmopj/TXOYiu5RbH/w7PMsONJOMayl4Epn
         ehf9Pt1G0InKnnigmZWDTvejCxnL9OaABQISK+uPyVyQR6NKbZwMXx5nJtDDn/p7/VHT
         F3Dg==
X-Gm-Message-State: AOJu0YwU293l6pfBl63oUbCN9SKMSIdenbT82gVvQgjIjU5nYq1A1Tcb
	brtceRUd98P+/Zbzxkjt41mC8v5sVmbwJRj6q4MX7KETD69/ECbOf948nquDqFFdlXJS0z13sWl
	HsCf3+c/SUp56HS5GTMXfrbBB7suj15nO7pXgiqNP48cKsxhOWiVLKg==
X-Gm-Gg: ASbGnct3zYuEH0sY2af2w9+qupoZ5YJLqG8LaIxOnAhs8YV84OAANQ9hugBVnuh/+Rm
	88As6G1Jvod3zPB5HnMiVdgkYbK3vxnxd
X-Google-Smtp-Source: AGHT+IGZ/+v8WaIO+Mj1FhtgbL2ChVdc3yVz726fpMuT7szYPyknZyHqm/Vwzv57Oll5QNpf7Nt1ZHocQ+tVjLUpqlI=
X-Received: by 2002:a17:907:cb27:b0:aa4:f520:41b6 with SMTP id
 a640c23a62f3a-aa5099eb73bmr806215666b.30.1732483139613; Sun, 24 Nov 2024
 13:18:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Roman Priesol <roman@priesol.net>
Date: Sun, 24 Nov 2024 22:18:23 +0100
Message-ID: <CAFxe_P8vo0OLqdG=7Oh70BOhePtL7oPaauvVgE_R6Qck61Wi+A@mail.gmail.com>
Subject: Asus ROG Delta S Wireless volume control doesn't work right
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,
Asus ROG Delta S Wireless volume control is broken. No sound for lower
volume than 98 %, only 99 % and 100 % are working fine.
Showing volume set to 98 %, 99 % and 100 %.

randy@whitemesh:~> amixer -c 3 contents
...
numid=4,iface=MIXER,name='PCM Playback Volume'
  ; type=INTEGER,access=rw---R--,values=2,min=0,max=128,step=0
  : values=0,0
  | dBminmax-min=-0.50dB,max=0.00dB
...
randy@whitemesh:~> amixer -c 3 contents
...
numid=4,iface=MIXER,name='PCM Playback Volume'
  ; type=INTEGER,access=rw---R--,values=2,min=0,max=128,step=0
  : values=62,62
  | dBminmax-min=-0.50dB,max=0.00dB
...
randy@whitemesh:~> amixer -c 3 contents
...
numid=4,iface=MIXER,name='PCM Playback Volume'
  ; type=INTEGER,access=rw---R--,values=2,min=0,max=128,step=0
  : values=128,128
  | dBminmax-min=-0.50dB,max=0.00dB
...

randy@whitemesh:~> amixer -c 3 info
Card sysdefault:3 'WIRELESS'/'Generic ROG DELTA S WIRELESS at
usb-0000:0a:00.0-7, full speed'
  Mixer name    : 'USB Mixer'
  Components    : 'USB0b05:1a31'
  Controls      : 6
  Simple ctrls  : 2


The whole thread is here https://github.com/alsa-project/alsa-utils/issues/227

Hope it helps. Many thanks

Br, Roman
