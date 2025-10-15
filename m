Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B233B302148
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 05:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760505418; cv=none; b=Z9a8fDXZBHl2WArAQIJC6a2QSKJRmeyXofo7kqNXLe7bKegu+DCgohBG8bSR50cpOzh3bXVGF8jMowtT7hGKP6DL5VuNkpW6Ff5BMmjAA7axQiwZllcO4M00UFpcqQ+8imOTSSsRIh29DY8sJKHRpSZyHNfKKNqJNEvEcRn834w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760505418; c=relaxed/simple;
	bh=ZGjZ/MXVdEJF72fYcarWQaP0NzCcNsyU/SpwECUVcMc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y3cQfxOdBFpQYenhLDtWQddwd7RSGKAXfj3mrFJjO3wtRNa3jrfj3/CylOaG0n7VLGO31IxiqUHzyrjRcU5cD8e7PaQK+kIxt475QOJqBJalMp4PR+8gZo2hYz07NDssUEPpkhNbEu7kjr6DBi+UUnHP5MqFGK+Jbk+oveuUTHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJV9/nFd; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJV9/nFd"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-796f9a8a088so5849320b3a.1
        for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 22:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760505413; x=1761110213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tmdk0eUxok1/vVVsxuT3HWDsufBCi+dhI2wWj0KYVpc=;
        b=nJV9/nFd1UqbnGsDx83xsaWSnGZjG6vUohEUJvj9trtKqzH3fjC64Jq4Ykl6pdU21J
         nvZZDaQRD7FiLcYRhyCetTEMfa9p6rdw0BCm5sIeFh7UVQ3O5Et5Susi047j5a4pR+uR
         X4rRuUgAn6Ds7aaJo3WwDP0lwjb7MUXVTPtZofMiNbNxpXLWGaTZmRlV104989+6sz+v
         ftcVwN84Z8lfY7X7BLIxyGw9SfysFrEBpNWo69ntfNSxcej0yCmBtaLwOY3Jq3e3etWJ
         7JPRHOQAdNBWJscQDaejOTodw7kXep2VIJBhkpZDHzs4LQA9MrAXkv7P0Tu579+2RaeX
         JfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760505413; x=1761110213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tmdk0eUxok1/vVVsxuT3HWDsufBCi+dhI2wWj0KYVpc=;
        b=uEHFx2l/zDxHq+IKKMyT+wHtlXlPqhR5jkQY73szCBs6JAc+M/r29KyaEsrKKU5JVg
         PBFcEzPWFTkvR6O/4Rz6fYxv8/cNhef/f+bgQqRyq7+ZC+0wZtOIbcfm9V+5/OdwRDsr
         dXs1a00EnAd5VZWwgJXJbG8Ldv9K0v2o9nPnx69eECu1n/+rlgTRYaLhIm/MgYuuxpP5
         3QVPvBjG8wgRfPUsjhCWHlHbfkOe7xYz9uxQN3azYHd+sRlH3RFdMUTxyd3grLm6GaLt
         yS9BXRu9ip4r8nUlmJyY4CD2aO/EJuGOg2aTwPksh5mo8m24roBSyWEmY0vG+AMXjDwU
         2sXg==
X-Forwarded-Encrypted: i=1; AJvYcCVGTSMypOJY9AXxCgpx3HRoUhN//yBte9PcQkq9FvcXofPw3vo1lmz06ZX5gPVFx/8iIYU59M4TTRlQmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIte7k1B7IHW/xTrs5vPBSa8Khbn3/QJbeFpK5Te7eKx/85Cfm
	/ZfpkhycM5lTz1WTpwRqkw7ffoY7134Xeo+IcEdcQ2JNUNZQNQsz4RK4OogrQffm/DI=
X-Gm-Gg: ASbGncuWQ+ggaHB19g/i0vTOQ+1EB8DNfk6s6pQpINeSeJUql7w+TSERraTUFq7lp91
	I3dFyK+YPbI1j2GPxviIDJp30u6UKDgwavxoz81S/VjgpzPDyy5FTZlxp69PZvScQyZkvIzJOCl
	nxUAcA7aaG8XtpekCz/6Cw9isnuLBtd1oEAaMNRJeDCtXNQhVMcJGN4O6uhLWBvdM0cZsr1pSrA
	+OgB63gbAHG1NNUdLnpK6ORE30us9MPG62s2x+Yj7QP+kNbLCSN4uh3ZI02v5KPii/kOJOqD8zS
	CKE/9o2RA8aOyS5iLaOlHr8WQ4GiAqjM22fq8VxKjLLMdn1Sm4ZuVaA0IlKzeBKBqzRcnMRbWMx
	b+rGBYeVsPZ4wS/BULWzg4ticJz4KPstkiIcMCOp4YuPgo9e0TJ/1SZRcQq0DrZ0=
X-Google-Smtp-Source: AGHT+IFOYftdOIIXBVMZXIT1YClBipwIdLEu1Hwjcj5w8oVhfvDSEoo4/1DrLLJoT2GyhMPacQVVtA==
X-Received: by 2002:a05:6a00:3ccb:b0:781:1b4c:75fb with SMTP id d2e1a72fcca58-79386e4f82fmr38130945b3a.18.1760505412380;
        Tue, 14 Oct 2025 22:16:52 -0700 (PDT)
Received: from ustb520lab-MS-7E07.. ([115.25.44.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b060a38sm17320137b3a.5.2025.10.14.22.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 22:16:51 -0700 (PDT)
From: Jiaming Zhang <r772577952@gmail.com>
To: tiwai@suse.de,
	gregkh@linuxfoundation.org
Cc: broonie@kernel.org,
	cryolitia@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	pierre-louis.bossart@linux.dev,
	quic_wcheng@quicinc.com,
	r772577952@gmail.com,
	syzkaller@googlegroups.com,
	tiwai@suse.com
Subject: [PATCH v2 0/1] ALSA: usb-audio: Fix NULL pointer deference in try_to_register_card
Date: Wed, 15 Oct 2025 13:16:44 +0800
Message-Id: <20251015051645.519470-1-r772577952@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <877bwy81wi.wl-tiwai@suse.de>
References: <877bwy81wi.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg, Takashi,

Thanks for your suggestions. I have updated the commit message.

Please let me know if any changes are needed.

Best regards,
Jiaming Zhang

Jiaming Zhang (1):
  ALSA: usb-audio: Fix NULL pointer deference in try_to_register_card

 sound/usb/card.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.34.1

