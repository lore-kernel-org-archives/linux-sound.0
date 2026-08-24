Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7E640801D
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 14:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787580153; cv=none; b=eAOlD6hj+8oT83Nd3d1dEmKXHVAp8aRX+0me7KK/Op/59ILeONqUF2B+hW0xY/de3SBX9D9MDPW5Ggss8UGIUmK2CAQ0wQH7i6J7WoccDUIvS+ssvjRjtqxuvMI9/3Jn5TVvCODVfgnoAv0p3ZlbFv39VMqxVfbo4mqR+KJFh6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787580153; c=relaxed/simple;
	bh=nBo0sYfIV5EWVvQ5NrewIuVyKBGZXpUl+xwuYiOChTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ocq+lJ04jBiVdBYn/mH+eeoDbK7RN3AdQ4wiv5ZuLaFfccVAbJGSDtjWqBG+vU2bL8YeorOqURegoYiv7BW+694Jbgp5gn8R0KE20yx9rAjyiN2Y1gG1wsG9qRIPqzdN44DxII5kCeWm+opu5pfq6cKgCQYjkkF/KH+IK3OdK/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar; spf=pass smtp.mailfrom=frba.utn.edu.ar; dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b=H2M9PKzs; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frba.utn.edu.ar
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b="H2M9PKzs"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4634d881742so1956910fac.2
        for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 07:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frba.utn.edu.ar; s=google; t=1787580148; x=1788184948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vOj2+TPbFf21YJlUgPiRF3bQWwvzsEEi9zhjmHxbJeA=;
        b=H2M9PKzs6u3sNTsNVkcdAB1oiEXwC8lCYgBmK3qYj6FGVrvkjl2lqlzC06td8OEpBN
         2+XueM670PCAfo8vpFSwCz4urX7kS07eihvYsukG1chbiRW+hgzNwcbsGH+LrINv0KmM
         KKGYYZjhVH80fOEcJWZVYSoNzD7fwFc1tVIVlRxeOmhMAaMSVPBT6wMxR+602Qu59BJa
         0q7t4ImHo7609wm7jZJSmdTqIRWMZxIt6+Bsfe4BSttLNp6VaUQ2xm2Fu53Ye20IZfGi
         9YAQ+k6avKvLz5yvTTInUz1FNIRp+gEnorfp2Fm95iDpVf1FDqVWAgns5YkW5ludDwN8
         1mHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787580148; x=1788184948;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vOj2+TPbFf21YJlUgPiRF3bQWwvzsEEi9zhjmHxbJeA=;
        b=D5C+BceBm8sVPwXJjl/XIIaJIEo435M49y3l2sfV6wuFRHSy9BT8hYfkRm4EaLpEpp
         H/ya7bXWGH6sBzeghBPxfhb0TE0Qf1m8YOr9voVuyvHlXw1qTNEL9lkZmoSXUi8SRq/z
         HPIwYj4Fdxy62okyu6JR1il4Y0R88gEuj4iX9i6W5Skh46TaQihv2/qdlOfTJev3OUKT
         yDa/00LIQl0qK1nCXvngh4uJ8xJZo/jWoL5sU+sU+hWmS4Z9NIuSv8hdldP9JmsxG0Wi
         VpOQ25BLywCIOyjzqDp8LHTstlJjs5WuooPQRPIPFNtBSpmF4SjgrS94Xbmbo1adatRq
         bzKg==
X-Gm-Message-State: AFuF++k5CGfcaO8C4y9HXMryQqVe0WtRXE/9qj3Ry1jXsDGFHTS/Gu68
	PFHs4VR+5pG7oRNTfC195K3Q0xzy0cUXoaMfWB9rDbzaqh45LuoprfLISZwAWHaiw0f41hL41qk
	eWoY3ahrkAA==
X-Gm-Gg: AR+sD11Bp9o0ga7ghp0JwoGeY7Y+bFh4CN4FL9YHJyVnO18XEspl9hZikYGN1rFdJe0
	0UITwX+37nILqNruPVOCUm5A6CcNnJwFCYoEUGxej6eLl4GBjaeNHz10hNUceuxtbdC0cEsKUlE
	e99WjRe3y+tbeRWJ5fkgueOZim7Wze2NGGgvFYgIbI9vsyR56NGv5DaJ129pnLgxzAfDuy7ezdP
	+vVBgEFJMNq+r1ygGJVaYwsdcGzobiKSqdnCOpqXdEZ6TLvyeKk800LXsJ4SrSXN9PfTEHNyXG5
	p5fbPmvvl7tXM7W6iUIj0QG1SIz/iJ5xkJ+qJKdVtf+lOy5gyIn42+9JhjIVWc2rfI0sKNuBhJn
	6RVjkpEgLYjVM8OIugLhnys+nW+Sj2aORYwXnH2PFQfL8QC64BEXaRjcjyvZ+tLR4NoBJBVE5zY
	5hgX5upDG4vFBPaicoGMe6j644eHLxIOsLu5e2yVevKls7i5GVmrXvld0/WVm/RydDlJtm1rH0g
	9ofxsM+mhXIHKp9Xe71ACoiuQ==
X-Received: by 2002:a05:6820:999:b0:6b1:7141:75f3 with SMTP id 006d021491bc7-6b17141790amr13515129eaf.13.1787580147622;
        Mon, 24 Aug 2026 07:02:27 -0700 (PDT)
Received: from localhost ([190.192.192.134])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1418619d6ecsm24872573c88.14.2026.08.24.07.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:02:27 -0700 (PDT)
From: =?UTF-8?q?Federico=20Valent=C3=ADn=20Andrade?= <fandrade@frba.utn.edu.ar>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	kuba@kernel.org,
	alexander.deucher@amd.com,
	=?UTF-8?q?Federico=20Valent=C3=ADn=20Andrade?= <fandrade@frba.utn.edu.ar>
Subject: [PATCH v3 0/2] ALSA: usb-audio: Include M-Audio Venom Quirks
Date: Mon, 24 Aug 2026 11:02:09 -0300
Message-ID: <20260824140211.17003-1-fandrade@frba.utn.edu.ar>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260823152733.740731-1-fandrade@frba.utn.edu.ar>
References: <20260823152733.740731-1-fandrade@frba.utn.edu.ar>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sorry, I had some trouble sending these mails through git and
misconfigured my email configs... Fixed it, hopefully that's all!

Sorry for the troubles.

Changes since v2:
- Remove duplicated Signed-off-by lines

Federico Valentín Andrade (2):
  ALSA: usb-audio: Skip reading sample rate on M-Audio Venom
  ALSA: usb-audio: Skip mixer creation on M-Audio Venom

 sound/usb/quirks-table.h | 22 ++++++++++++++++++++++
 sound/usb/quirks.c       |  2 ++
 2 files changed, 24 insertions(+)

-- 
2.55.0

