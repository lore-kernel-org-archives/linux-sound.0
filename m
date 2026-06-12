Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF4B125A0
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 12:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781265773; cv=pass; b=V4GcCdLoDbnBlaH8IED/DnHMi2qBq3Jro8GBeu5UQTD1207EpFYEtVz+aJaczI2GfovmDF1KF9FIVQA5ig2cjZYCgwYJ2bhbbc+7QlaiIvF6VTcz7t5zafmo85zaZVb04wHTsMCJKedXxwPgxX6kF1BPuB7O7KQLVU2o7LtxkXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781265773; c=relaxed/simple;
	bh=Ue9Q/5hkpKc2K5b6042Ox6E1bPXVMDfYByTzdMG+CHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YonS+hKSvwTPiScBVcd+uiPa6J8Pn1/fQ0rnA0Y2NTp0RiGCisXwDsKxS/a1oB8RqLH1cTwZi6PLJh2MVSPBW/pdppeO1abR7UAWW7A31lQl1j/5x43spM+zXDdM4ilBk0aeDX7XDap7ywZkzkDQKZB7a3DhZ5upc/Hqn364Fbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Quzu0EAC; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Quzu0EAC"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6605c3453f2so1032499d50.1
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 05:02:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781265771; cv=none;
        d=google.com; s=arc-20240605;
        b=F4pqvhrP82/82rjZZIKKo6P91nZZm6S9X1yif4eZihLb3Pm9EVBL/qoFk7CCOcp9fA
         EMLA/+2Jn9Mzjr8oP5jJvhIpH+kapgSovpWPvPdl+q8ZSlr2F7t1IMSazN7hOwNyIl8K
         mx2R0INx+dJtRFGyjn97gNpajqL3x17z/bfTn1pJ/2Yhjdd3SuDUpswRzZa0eHPm3Djj
         d+OTKkr8bJxzrzq1BTdvwebVYJVh8rS3tmsi5EPOeKmgBVuEq327lCpM9Hduhr53+GLr
         OPJKS/QOBeUnZwEEsjTy9rZbe1Wbh+YwMosyeKxuIS9hBEFqHWauCgEKXuKyJHuYBgTR
         JLFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M9R2kZF0YaGL8823QXiNHxRiZtpG9XQtOTXguSejKYA=;
        fh=V8W0TViz8XU8Pp8/scINkR8Za+A0ROkPCVAQr2owVZg=;
        b=jhEkFn9HM5+Gjy/3T02MsOobwVk8+9LR2xDhhK9syv5wVC8mH9DmY6TD5+j1qDiWSf
         kIY7nhyZa2eVvGwQIkCYZWZEGUryfXdel46p15FmPx6F3fOX+AEHmVYXwVHPhC0bZrTr
         09AgRr6uYuv9dawE3V5bnugcmCmou3adTWC0CH1vvRC1UOcshsWfDPT2gFByq8M3PHzV
         tKLbCX1x1cP+RhcjfRHA6h12l1ebE0rohQSfvLzT5YRNckLUUcP9d9zUN19usNR2Vqqw
         4OdfITnv2Wnk/XC4/UHmi9cjmyZ55t3jwmYa6IF5l8mHEvNIXX7wMRum/KQ6mWIz6LiM
         h+1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781265771; x=1781870571; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9R2kZF0YaGL8823QXiNHxRiZtpG9XQtOTXguSejKYA=;
        b=Quzu0EACYdbJPo7tKieAY0jl45Rh5t6Ft2/prgMBmYs4jG08HgCFh1s2bWnhP6YECO
         8Sc9kSrKh9jI89EnZwDKxKZa8h7BCtQ32mF8inil32EfvSDv6FbnSf14aDqLc2cuWtdv
         DSzj+k+DxdkRRTyoslGKv05fCZh3but27dCwK80jC7tPbp7k/pSsJbDlVqEILJc9XUBj
         J0uoJrwDc2ELLUgwL1mjv0iqh00ad2vxxzLhugNmg2N09YuLQcVRpE+RzbicZpvIzdv0
         aZfK6QngFa5OAOzVz94BxFonOYPor9TVlqG3TUVfqJH2+ezJc1tAl1N5jf2ILgHn+0N5
         3zEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781265771; x=1781870571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M9R2kZF0YaGL8823QXiNHxRiZtpG9XQtOTXguSejKYA=;
        b=JLM2YRESHcIn2aNuXPseMJXmC497OdlL9JUFxLfYvVJ6gU7hPXt/6+p46B824Xhrku
         KhWrEKPwOHacnz3+PDk7C8z8wSMMcV9MiqSEddXzLefaAkqJsS2k9ohKDdsoap+KJBOK
         nP3VZUH+V83KvS76xiHhZk18Za0+WGiCL4W78gHItNCPUED6TcsGsu1YYHXL6f1PiIIo
         ZiA3CUER2bWT2DecKjSW89SIw0DvNvcSYc/PJLxXQ0qYMrbVpU/xmsf/ppagX1tEvgwK
         G8H28EFlKgO93MGgIK0TyXA8A/YtskuBDf7QYz5Ey7TBgHvLMwSh/XscCfsWorJNBilu
         K9IA==
X-Gm-Message-State: AOJu0YxKLjwHYF5RXBraJv8xqlEYe/caAwWgasI/Sdo9U3waztaa1n+p
	fAF8S4IAfgB57PPG38rwkc1A+QDoJN63UI2kvCQWTUolHe91JfwHq9xFuRYMDzTQgwaVUSGEQ+X
	zMsxAsFcGDZnncpL21SvJfrOo340f1hg=
X-Gm-Gg: Acq92OH9CQeTnowO2t8exKa6dFlQuaGnGi7e/w4qJcLk+0IFHadOFwzuShLRwi9R7v1
	2DDkoPRbJ5pTYcnuBuWLCQQ9DczKtaIP2a2c4fUZ+1jmJLPSnOOB1259Leb2tBqwAZVJvASv/QC
	XhSAEVbEZXNIih3dTXo+3ofBluJq+XmKWkE/OQnFeCddHhsXEjQUNhzaj7psu13kyvI+lDSpgcY
	ajQiKwhShFTxOZv3Ogsz3UkMcqA9hRkASj19MfSiyP9B9IdfDQV3AYH+INayOjBhQdPF1jy/U45
	3o6AVPkmR+VFW+dmrHHzbkUMQ/BX/gj7nQ21tUD3q0syOQpic2hpm3HM3mW2rQ7oXICAorCJdRz
	FG2SJJ1cwuTKlY+aUATVX6aqtHXgt5u80bIfYaOu4vsP3wsKsRjuBpi9VAY8=
X-Received: by 2002:a05:690e:d81:b0:65c:6d4d:a218 with SMTP id
 956f58d0204a3-662782c6f77mr2027139d50.20.1781265770917; Fri, 12 Jun 2026
 05:02:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612094601.1209845-1-cam.graham@gmail.com> <874ij8htz5.wl-tiwai@suse.de>
In-Reply-To: <874ij8htz5.wl-tiwai@suse.de>
From: Cameron Graham <cam.graham@gmail.com>
Date: Sat, 13 Jun 2026 00:02:39 +1200
X-Gm-Features: AVVi8Cc6Iqg11sqHj4McHzvcADNqXtjGs6cUnoXcIlyp9BSSxt0buvmIwPRqAG4
Message-ID: <CAG-YL0h+1Yuq46BkBaOfeJsnfLq9W1uv2-mpE=p9LJhMQYPO4g@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/hdmi: Add force-connect quirk for HP EliteDesk
 800 G5 Mini
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 11:35=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote=
:
>
> Applied to for-next branch now.  Thanks.
>
>
> Takashi


Thank you for the review!

Could this please be considered for stable backport to 7.0.x? It fixes
a real hardware regression for the G5 Mini users, particularly media
center users using Libreelec, where kernel updates are somewhat
cautious.

- Cameron
