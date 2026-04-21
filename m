Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CC5346ADA
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 12:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776773275; cv=none; b=VKzmE5ByV20SuhtrbOYBCf2OJUh2fjsfvlkUvLCrtS+0SfHVZPxDIaj+MSrHItXanGA5G31UYC7epkyVA3uixOf3hoeqZjYvWLyEvtCLzVlqT5aWHBPF+ACStptm5sZ/OikoeUtW62vcG2xItsw6g2GuEA/qemsicFtvBH09qGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776773275; c=relaxed/simple;
	bh=JbCmSEhMj5HfeLGp4STM4hU60tLUdLhuElGdoGvW/No=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=UAlqPGxLDimZ0Ro9H6gQqAwSTxMnQB5OUt1ewZJX2zdsBR3MwMN0Y4xcA7mOP+05OlBP8mhzq+7x/0TbJMZcUw7BBrQDIS5jM3OeyFNU6FCula51yOuCqo9RM9c+hyeWC4tubStW5ox8FXbh3KdFHEiRh3rKkKQBI0lyx74eu4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMbPUws9; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMbPUws9"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a40b2d26a1so3311554e87.0
        for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 05:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776773273; x=1777378073; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OozudbymEZ7NGU+5rFZtQr3/MVPLQp8RAMq9QDqzhfk=;
        b=TMbPUws9R8qzxmPORAatF296utAmEZV3ylos0JP/74Fxc5/N/74/YoDZfYyY7G993v
         Lssu0c195Hdjzex5E/meDVlRfQFxFK8kYdwYyayJBk2HIdeXqtUrl/u6nyCJfiJsYStN
         quepp3q+KO1xOpHpYfA4COJIdVqHuI6syG1AsOC4Fs3BHGi5qVXjt9vLkqIbac/TU9Oq
         rdI1HsIgx1LSI+Dw4dfLw4Yu9ZGPoo+suByEqXZmMx3DRtHQIO5iE0Sc+fmnrw4tNMBe
         aB9O2vCjif88PPnUS1jDe/2I4Gl91ApdzbblcfxW3y3M8MbiFKINm0cxzPGLjSrQf+F6
         6EMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776773273; x=1777378073;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OozudbymEZ7NGU+5rFZtQr3/MVPLQp8RAMq9QDqzhfk=;
        b=U2hXIc6n0BfD+/HaZCqiViNLdqx0y/3sKIaHm9O/FC2NnDPARda/mVtCPNeU/3CsC/
         CBmk1H/l1GdM7P0xZioO6ewS25eMUjVFEs/DkECBT4VmX5ycXF5RD3wKinwQS3iQbwbq
         1KA0btAD6e5AD8CrMKrcQ7tRD++My/IZFipIhx7oMDpvoR3X/c+N4C16VeK7mDdGb8vV
         Uj/KIWJezo6RT8vdwYij/RRoSXKMhLZS0dHkKrmf/4lpfot8MvefEwJKc584T8v72aAx
         epFknlC3ydsiFZW2EqZTIIO+z/9Xr4vwCZ38s5bwI1ll9DBOsmarL5GWCLv2HtDPSujT
         KOsA==
X-Forwarded-Encrypted: i=1; AFNElJ+1IuqzdqCwy4aw+bI9tD7qMYDys+qiNS6Gx7OdsOcohFzxKYVeLD+etjIdFKIG47qwz3XQaSZR0zgNsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCvXOh6ic3VoU4fJp54HfU/j9aEElN0dnEE2qqWUy/T896eyJO
	4qsGOf5+aOFHzpSSdjmziaf43Z5IaSFra+oyqWeI9feRytqvLkD3/i9u
X-Gm-Gg: AeBDiesvey21p2VfiFTP365l9icyBvayphm+M1W89iF+Y3D9GaOb2IP7C9qlfh82lha
	lBtGudSO90i0zdUNXKWKPecOoDlehAUEaG8f0z9I6PSmjsWohh/kv6op4J3GYs5q6Wm1k25zWEW
	S70+thSiv4JTPl92+zkYNucTDXQEm3GtL9trATXKnqk4LICs+UzhxU3S0Vrfweqk52/6E8mMtvK
	Svlyn7ZI5xPeYGkkHuEHji6Fj8B8Cripv7AWHUnBACgGTBanZbvMpkhABU/x4edpynRDf+UcRoJ
	WvzFSlyxJKD6yzYvSWiJbkyRbt0EYeXIUjrwGrEvT8RMdjDu6wghbXu0Q9zj5tlQhTC6DX45GAE
	XtAJ9lbDfZwb8U0Oll6uXb27uXnueVSkxjg1JJVlsUZv5MYlN4TaGwNgnzRe6ZDofpaexu5Q5R9
	2DuLLIyMYKyhYXyCc52Ue1EsoU06F8/kWWwtDps4bqZi6rt/yKKRJl9RVzRrB4WVJ5MTbavO22+
	2R2mXn/6wLU6R3tdJtBCnknvtU=
X-Received: by 2002:a05:6512:32c1:b0:5a4:6a5:9900 with SMTP id 2adb3069b0e04-5a4172e4788mr4538488e87.34.1776773272327;
        Tue, 21 Apr 2026 05:07:52 -0700 (PDT)
Received: from ?IPV6:2a02:2698:242a:1c71:d5e3:307:560c:a869? ([2a02:2698:242a:1c71:d5e3:307:560c:a869])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7a3fsm3615262e87.59.2026.04.21.05.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 05:07:51 -0700 (PDT)
Message-ID: <8ff364cc-c735-4e42-9d5d-775b76621e48@gmail.com>
Date: Tue, 21 Apr 2026 15:07:49 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, david.rhodes@cirrus.com, rf@opensource.cirrus.com,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
From: IRRatium <majnkraftiigry7@gmail.com>
Subject: [PATCH v2 1/2] ASoC: cs35l35: fix typo 'overide' -> 'override'
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Fix typo in property name 'cirrus,classh-bst-overide'.
Add support for the corrected 'cirrus,classh-bst-override'
while keeping backward compatibility with the old name.

Signed-off-by: Sergey Shatkov <majnkraftiigry7@gmail.com>
---
  sound/soc/codecs/cs35l35.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index 7a01b1d9f..XXXXXXX 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -1311,7 +1311,8 @@ static int cs35l35_handle_of_data(struct 
i2c_client *i2c_client,

      if (classh_config->classh_algo_enable) {
          classh_config->classh_bst_override =
-            of_property_read_bool(np, "cirrus,classh-bst-overide");
+            of_property_read_bool(np, "cirrus,classh-bst-override") ||
+            of_property_read_bool(np, "cirrus,classh-bst-overide");

          ret = of_property_read_u32(classh,
                  "cirrus,classh-bst-max-limit",
-- 
2.53.0

