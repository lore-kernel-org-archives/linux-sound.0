Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4811F4A08
	for <linux-sound@vger.kernel.org>; Mon, 12 May 2025 12:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747052208; cv=none; b=PmvF46huUmQWBKgYZ5orc8vq/r8jmc4aDLXiRqkCIDjhWWd+3OblvA6IqJdJV8xmTROQbZuLCkOKtDekVomZstRbW5V9xj9Qqs1t6cwD3VyiyePCE+Hu/kzsEdSmitT0sTb3MIkF8lgAiO2BEgYHUxyT6zhpHNT3RrsIBsCiV18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747052208; c=relaxed/simple;
	bh=72Mvezqa5y8PEFEKTpBHiUP6TdXgSqiCXlwB0sa7dgY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=LvsdVBRvIP5cCm0lqi8DMdRin08ZW40PkKG3lCILlPrWNE81GBSQnryITwaVG+4dkvlmsnNhWrPrf7VTgfOajvbv/82j1/hQiUW1/zSziaQJ73orf3kcNZ6FQ5UWD12h2T5Fpr6INBOKirq/YsucQ7p3kBrqHvx58RiLwHaQmkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NuMQManC; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NuMQManC"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-73972a54919so4165218b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 12 May 2025 05:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747052204; x=1747657004; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=72Mvezqa5y8PEFEKTpBHiUP6TdXgSqiCXlwB0sa7dgY=;
        b=NuMQManCuIx4TZmzz17nBCkS7LNatfIsI55I2AS2frIxz9kGRMGR2VsKzI2rJP8m7I
         X+O9q5J2jsFy9fm7FAgrm7lkb8mORzPcQXTfbhoXLeGEBi8rHUJC+wlOvrkWfp2xbxy6
         kXpqvvHVxQoEkVP3mtQtFtlfeVUdbWwRlWuQzkYbt7+LEzSZPufddr3Eug70cU5kR3Qf
         JASiVMAnefqihOGKzjgTQa+BT0/sshTjaDEw210o61MRtI+aJUGRs9DYjWE+vg1ner16
         T+hpOn0ySYejfuRPX2Cmf69zOvOqL4/KKDcQ+HAEMHNiCn1wMzcg4Ux14XxA9jTHpG7v
         iQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747052204; x=1747657004;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=72Mvezqa5y8PEFEKTpBHiUP6TdXgSqiCXlwB0sa7dgY=;
        b=kErZksY1GXV4tSErM7DVFr8GaD82yenmHaJVgh0vE6zzQOfquSdrLYvlkfdYUYGyzJ
         P//r4OHzGfqgZS2d0VFv8IIFVZzBMydYEQaVP0On53rRctBT75D8t81MPkjVPZ4I3MrJ
         Hg3rfPJwxcgrbbzj4fnDSkSxf2mVIe902ob2R4B9Qp/vo9b5WR2aclxsmBJn23KMRKYC
         0OCgPB5H8dbrZcf4i4JUY2jS5tjDBH4KFL2y9Y/6HeK+1Cl4l9hBbNZAwh49uuBGlQz+
         DMI9441INWFOSWZZ3DFcZWktrkF/AKC8dQG4BdvrCLcEnZpx38S9R4f001KSe5py9RTb
         httg==
X-Gm-Message-State: AOJu0Yx9ifoaFJVOySF+Qgiy3jjEDztKGa7IFzlPJ9AAQcas1GF4gek8
	weTmWCF35TqqkZeV5RmWCDtfrEf+J+4YHJuDvEHbbb8S9sZ7IF4iVple9kXqwroWY/0ZHO/6AEm
	ZXlIB0Gcw3M18K+wvrriaM6IbXAr37SyU
X-Gm-Gg: ASbGnctB//fQxjhCnE3r9M+F7gM/IOncf1u5bZGM8rI1f4/CdXCtRfBJQWMzQ6hudIF
	cu+aXIJ0VOCM6oybBgn91uo/9N1MCbBmkYC5SOvhQCZJr7zzEMKdr9XSsmEjelAfmmABxeWhUfC
	iyoU+mVaC8ZozJjWOuF64ohvIpX5ZNPbCrDsKK4xPnb0o=
X-Google-Smtp-Source: AGHT+IF3q2nprCT463e6FYrh3mcoi9knC8aoHT0JQZXw/XI3j22SydC1IR3QdAFTiwCIiPdXB5iXEEqV83uRa15yIOM=
X-Received: by 2002:a17:90b:1d81:b0:2ff:6e72:b8e9 with SMTP id
 98e67ed59e1d1-30c3d6464ffmr20662301a91.25.1747052204123; Mon, 12 May 2025
 05:16:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Pavel Nikulin <nikulinpi@gmail.com>
Date: Mon, 12 May 2025 18:16:54 +0600
X-Gm-Features: AX0GCFvhfd12MonHR9piOmmNrbUZp-flPkfIUaMYXuXZ8w1lTuFZhrK_Hy5tKIo
Message-ID: <CAN3U_kXUgo2nTH=oDrpAfprGgeGRxXCKbVXCviPFyOCqc-s2Ag@mail.gmail.com>
Subject: Mic1 is not working on Asus UM5606, only analog Mic2 works
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I have an issue with the Asus UM5606. The analog microphone works, but
DMIC doesn't.

Alsa info https://alsa-project.org/db/?f=20cd19e5230a321a54628011fcfc1c11300f85c3

Can someone please explain which of 3 sound drivers is the correct
one? There is an HDA driver, there is a SoC driver, and there is
something called Sound Open Firmware driver. By default, the HDA one
is probed, it seems, please correct me if I'm wrong.
