Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FC51FCFEF
	for <linux-sound@vger.kernel.org>; Sat, 17 Jan 2026 15:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768662599; cv=pass; b=GFs8FS44m44oFYS9IJf60/8O2gq/pUkoGQEVSSgAP1/aj2aWNHk0tzQ5RTos3I4RaNzfMAP6EE8AUhdMouMb9WYuSdUQMTw8/iVlg1j+LXiY6PNRTQ1w/ZHpof3FobojinRUpzGbNRfWarTslWoe+TESkkKwptLPf1QsX/Bp17Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768662599; c=relaxed/simple;
	bh=NAxVDIVyZjjlxppSvnv2XZan6iyQ31HEiPK8qRSc9Vo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=INr3tRC4Xryulur2RH0E4Smoz9owYp/ZCh2kO9MESHZ3iOt9SAOeXYQRQq9htgv/XeF4KcPJmubirgxACZXFNvdmQe3kTntmOg9JGHcf5h+ufxpLcJVQdMIgVjyJGKvbS8QWL/F1PATlCBhhu3DZGhQbIU+4DWShs8dQT8/H5FM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/+qjBFV; arc=pass smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/+qjBFV"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6610b241d19so1492950eaf.0
        for <linux-sound@vger.kernel.org>; Sat, 17 Jan 2026 07:09:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768662596; cv=none;
        d=google.com; s=arc-20240605;
        b=fPrw6IL/ikHhcw7om8qWkEU7KVN3WOb+iAr1GO9mI0iZPzHiX93sRPcRQrcYgmd6Za
         RvtXaY3HYyYVa7ibcReqDko8jbUTlTSPKpAzdR3fmhK4ld9K2slu0ko/IYj4z7pkW1Tc
         CTdJx8B18PU8zG5gIQrsWVoPmEks+bFAuEpZQ3pjP8wXUvoNTqrPW0KQQswb4TzkzVVw
         6rJcPGiOealkzFnF1ydLbMc0KfoRzeWwxv5WagSBWl3CJyEXXlzz6Qg3i/HXPajuc8lK
         goip95l7KU05NyF5R+FdNLTMnx5wR5SjazhF843p8H33shJrkTXxFj3wb/ye/VxyALfg
         a2Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=W/9/j/9n4VAj3vozxwuN6C5caIUaITw/zX09yFVgGVg=;
        fh=NoOij+RJAKaFqixKCqziPqVOODJ025ssSMc4VKV1+gw=;
        b=VXUgdCwIO52IL9gG7HV5kfsefoHZVch00rkz36J8PV6BROVcQAoCRBoclJnNi0ro3F
         fbSIheGP3dfCdB1h0Cu3OTsv0E7x3UVENLqShzP2fN/hrzJd8PwO7zo8YDN5Lniert3Z
         3/oUxePeE+i518FSX8hSXF44r/GcEwaFn5GxQDmGaeP+0r77BCVIFMn99jZkVXQydSnO
         Jyu8EAAbLTvNCdI5r/dbCYOjS1Iqf8/SDR5dVwEw6l7lg3/Q96cIL83FiPZ8F9zu6toH
         HPQyRF52v6/yakjI5CgabJpsgj36rXpm70muft+dOodnLLY0xSDSuhhv2VLEMwgSHzxV
         4+HA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768662596; x=1769267396; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W/9/j/9n4VAj3vozxwuN6C5caIUaITw/zX09yFVgGVg=;
        b=K/+qjBFVnz7ngXQp0f+qAkGHC4IK9SldZjDMJfW1gUiGc7ekHEKTfSn1qxuW6kS76S
         KDlJwoSBhayUujux3uhL5HcLTeCEcVyrmQE4PXqVrYQpHNQ3HhxXXGqOSu+rIfvzJfMl
         SFYwbIE1ZFOGzFyIxOV0vei3LrEaEJCW+mWRe8olwtitS8cC8GEAZKq6/6Hiu7v7uPhn
         dGQC6fg3CcbbUkmdUazfIAc/6N/i7VAbE4pjhWU6CgOfbkIo8+NlmZWpLCWgXT5F2D7B
         3vqW8Q0qY20kNfPLdm3e0KhFwjbi0B5giFlAjmQs0oI/EYFFVvLGMkxqb0gmAXLYpWoZ
         mCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768662596; x=1769267396;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/9/j/9n4VAj3vozxwuN6C5caIUaITw/zX09yFVgGVg=;
        b=id0EwGHEhOu90Gg3kQ+S58SbToZT5sTtTg4+Ym2E+yCuZenOr4WxlEhry07vXdMESq
         taeq/Sve1+yxsgbu7+gX5VH/dAsFfOt98OH9YaOfs4KNIb8scI/9CeeVRjXTc5nPCYQ/
         N/YU5O73NG83oysfcxonCcJvPumGqFrHYzjN5yxtqpsvLLvaW2t8A9TXH6Hx3rYd7eBl
         /+FnGXLo5OGB+SJS9q1VhEi1z2PG+Z3oP2R+lMCJTv5tESNmIIOHOT86pocdT4rDdhAl
         ZIqk5OVm++gY6aWxibA18rHbDt30QhxbpaQHDlhOWzdF205AYNTuXtSG7besMWr6vTAu
         xw8Q==
X-Gm-Message-State: AOJu0YyRx3l2f/6VLEErLqM38zuxPStoCFkAvYl6RiyFesuVXMpoNb9v
	eP/WQce9DW8Wxll6BcEkyJlV0j1ZruT93jX2+vDOg4b7WQ8HVT53JBwBpsHcClgvTjnkQsnUM+g
	iEk7HN6dX6S7oZtCOTS8xgjw6avm1S7V265wR
X-Gm-Gg: AY/fxX7767epHyxVbz1SYsxuuUr993+niSr+f0vi7LdzeuG/aCWnYzz3yKuA62uIovp
	C09qO7KXcymI40M7zzx7PWQwSwDJ3D1yUK6m9aooOUxtHoXIovxhiBZTTr9mfubznpGdiKibSTW
	iJvrh4SzSjssEnmxBiiIk3Jnl4ZF4mfy8MsOsUbw7gy0KSB27YIt9KCqMiU2ows7oVnaR7Ja44O
	NCoo5MoZcSWP4Jbx7rVF1JyhGIVdyyUs7d9WJ1Z4rJ2RnpRxc3X5UXNG1eMFFBu8ENGLTavGo5r
	Q+oOS12+dNK7L7qBUZVXjD+aFXDv
X-Received: by 2002:a4a:ee06:0:b0:65f:564f:34b1 with SMTP id
 006d021491bc7-66117913e21mr2968820eaf.16.1768662595669; Sat, 17 Jan 2026
 07:09:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Anatolii Shirykalov <pipocavsobake@gmail.com>
Date: Sat, 17 Jan 2026 16:09:49 +0100
X-Gm-Features: AZwV_Qi0f2-0_IzmfCh0uLtZA3OQmunSREF3WdAEHLrgZKekIcbRQaefmIlCiOg
Message-ID: <CAFzRAosPRRt0AvJDwVjgrbbYTkWjd8ebq3ixC5RcCwGTLpyfVA@mail.gmail.com>
Subject: [PATCH] ASoC: amd: yc: Add ASUS ExpertBook PM1503CDA to quirks list
To: lgirdwood@gmail.com, broonie@kernel.org
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add ASUS ExpertBook PM1503CDA to the DMI quirks table to enable
internal DMIC support via the ACP6x machine driver.

Signed-off-by: Anatolii Shirykalov <pipocavsobake@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 123456789abc..def012345678 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -300,6 +300,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
  }
  },
  {
+ .driver_data = &acp6x_card,
+ .matches = {
+ DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+ DMI_MATCH(DMI_PRODUCT_NAME, "ASUS EXPERTBOOK PM1503CDA"),
+ }
+ },
+ {
  .driver_data = &acp6x_card,
  .matches = {
  DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
--
2.43.0
