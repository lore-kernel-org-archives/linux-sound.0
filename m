Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4133D313520
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 15:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809405; cv=none; b=CWmLX6jnAWOjr6ABWLvPsRsOGt8lAlb4xbsD9mfQtPSOs1mGdJNUScLejJ3vGu9FvzeepPmgGAx2QTgMZI21imVkQAtrMgpaNYJ1/Eq21ojsW6yBwwfAt97eROH6hPJ+GCZ63p4ZdNiVIQMPu0O/3B8FM42BcSY/+Xj8eQc/Mgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809405; c=relaxed/simple;
	bh=gtARaji0iedyihFboa4MiYFPXacfVkUajiysfN3oeaE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JexInoZXT9CIWS3dmtFdQuqdQQOg5+/r2UJwcozjLg/QNoLvbGNoPa+x/tWqFisgWPZHQt3iufgx0EADrYyvasgvJy7sgjzrOfGiTVkD8MDXHqqBLqmyPzK8Cfc3Tn4CjsYq1MpEq0FpkXNO2BDEE6o6mu+cogCbrcsm8GUflJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tqufA+hu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tqufA+hu"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490426d72f7so40850495e9.3
        for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 08:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1779809400; x=1780414200; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1nEjxAN1sA7rfDN69w2hPO+PESN8+FOGSXAcryFYRJQ=;
        b=tqufA+hu7Jjx0aUFggOOVXILhIkGTmXFa4yMHxgyrvSua8x7kakM4oB0XE8XLbsdjT
         ApZode0YGocW6+vUmyhHXrXGR6jD0jRCyl1GRaKDMkgP48R2nAjb7QmQ9LUSevpm5Ysl
         cUmU0VAwqrqE+dLYAtDxMEl5XuYc5oqZuGjuNIlK9AWngGFtgX7N3Xgvx7a30V/aJaC1
         /HqY0LYhRXwQefKefYqvPbvhSb4J3xruz0UyTBi5bX3rnCtzr7NH5phuwV5KXU4wrO2E
         Fimly5dkHd5MWEUOrxUa878M9R/8MDCBJDceL7Sp7hfDzJvbUc7B6KCyTv9gwA+Mda63
         lUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779809400; x=1780414200;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nEjxAN1sA7rfDN69w2hPO+PESN8+FOGSXAcryFYRJQ=;
        b=Nadz79y7NP60srh0wHPDyRJm3I5tLgJykuja/ZHtl3MvMEg9Gs/+Y4X02U9N82t4Fr
         4bMgM0kobNP2hWWLfBK+GkVlMiH3ynvaq1Dek+6URr22zfeIYkBBFxbpCJ8jRfGptIBv
         SYjFcGhUqRImLk71ycl7eZOtPwHXBjg/ujeWkV++ZREcjeMfuTVhtCOOuqUBgtps7PER
         oiUsqRIwiHx1GGwRVLIp7VoyzQqIJiiZr4fK8GfTyh/ssU8AKEbSLc59jTpUIo2Eg2yD
         VznEHN7avRN3tpSCD79PyGoxtuTwO9uxWImIx+p/ftD/KnQjn94kkwy/VON8zJpTqOTM
         pJZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6dreKNfoEq+L2OQvZ8mhBkUmxsJNR8F4KN8FIr45LdvZzA1s3h7rUWBFq2zZ92QhOj9HEBvLCLkDnPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTG0b7PncJqB+Df5s0MBXzbg0LygJtXMEkFB2ws67rZfI5v+wi
	JL5Gs1/Xo090dz8wcwL8g8cNUg/80I7H4gTMyZkOccDMIA3DjZDHuhFZPmSf2E1haws=
X-Gm-Gg: Acq92OFPOt8qsGfJZygVcQLRAgMCSTfQkw5iP7T6u0h2C4+aJR6V5PYbXDkZ2igQIJq
	qe+mXCn4ZSMkdaxLGDHmkB00kqHviqnivRbqxe3gVYNELTkU804tcwXLAnDDykl0og0TG98zqA3
	LdGaDzMzSHd0IliMqSV3xJUlQal1TDkWYAVOQabUTPBNBtWavt0NLbXzLVg68AgQEM/ZVcN+D2h
	yv+ur5qX68Y5hzknUPz3cHFma6VA5e//RdFOjl21NjPrUWEiyueXznYn5l3HkkTkdpd7MHkDLiC
	ze1v7mzScUpB7rjwtVRj+ixpDU/HUQ9ujw+1+h442e3iweF4KsurkC2X3ulMsX3UhjbR12myhmQ
	XykZD4B8WBKpuEjx3dPRXQkVRzpn4nDIqPq3V0FrfO7zEClre/p5q35vCHHAqshucspcTPkQgPI
	ypEE824s5woN1DW1EFQviEPjT3ZlXz4aX+HIN4exTK9D4=
X-Received: by 2002:a05:600c:4ecc:b0:48a:557e:6b4f with SMTP id 5b1f17b1804b1-490426d2805mr289300505e9.23.1779809400016;
        Tue, 26 May 2026 08:30:00 -0700 (PDT)
Received: from [10.107.1.102] ([212.133.41.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5caeesm37691140f8f.29.2026.05.26.08.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 08:29:59 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH RFC 0/2] Correctly use TX macro v9.4 for SC7280 / Kodiak
Date: Tue, 26 May 2026 17:29:53 +0200
Message-Id: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyMz3eJkcyMLA92SCt3cxOSifF1DQ3PLFHMLs8Q0wzQloK6CotS0zAq
 widFKQW7OSrEQweLSpKzU5BKQWUq1tQBjjlraeAAAAA==
X-Change-ID: 20260526-sc7280-tx-macro-1179d786af1f
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779809398; l=2723;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=gtARaji0iedyihFboa4MiYFPXacfVkUajiysfN3oeaE=;
 b=DU6lEr7HK0FtWOqwqRd+8LMDKONgKKPlX25JlgyaJSwT3dFB77t/ULxjshQKkiEu45KTBKZwn
 vUbIT0oHUXZDoL2/SiTL8lKQUWfJWAZDbv6gsdf3/VihGLLtWnKEmJG
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

With the v9 data, that sc7280 is mistakenly using, the controls will
have completely wrong names and using wrong code paths that do not apply
to TX macro v9.4.

This is an RFC to get some feedback how to continue.

1. We update the "qcom,sc7280-lpass-tx-macro" compatible to 9.4, break
   unchanged dtbs (the sources are updated in this series) and break UCM
   until it's updated.

2. We add a new compatible "qcom,sc7280-lpass-tx-macro-fixed" - name is
   just a suggestion ;) - and make sure existing boards with audio keep
   using the old "broken" compatible. This should be completely
   backwards compatible, since we keep the existing compatible working
   as-is.

3. We add some dt flag "qcom,use-correct-tx-macro-version;" and handle
   the rest similar to option 2, by opting in boards to the updated
   behavior.

4. We keep everything the same. We know it's wrong, both the
   audio-routing in dtb and the controls in UCM have incorrect names,
   but it's working apparently.

Please let me know your thoughts.

As a bit of a note where I'm coming from, I'm working on microphone
bringup for qcm6490-fairphone-fp5 where so far we've been using
qcom,sm8450-lpass-tx-macro to get the correct control names. I've tried
reverting to sc7280-lpass-tx-macro, updating audio-routing in dts and
UCM to the v9.0 names and it does seem that microphone (AMIC1) is
working with that, but I'm not particularly happy about leaving the
wrong control names everywhere, so I'm happy to try and untangle this
situation.

I'm also not sure where this v9.x actually comes from, maybe I'm lacking
some documentation, downstream kernel only refers to Bolero v1.x and
v2.x so these seems to be a completely different versioning system.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      ASoC: codecs: lpass-tx-macro: Use correct config for sc7280
      arm64: dts: qcom: kodiak: Fix up LPASS TX macro v9.4 control names

 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |  2 +-
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |  2 +-
 arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts         | 22 +++++++++++-----------
 .../dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi   | 22 +++++++++++-----------
 .../dts/qcom/sc7280-herobrine-villager-r1.dtsi     | 22 +++++++++++-----------
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           | 22 +++++++++++-----------
 sound/soc/codecs/lpass-tx-macro.c                  |  9 ++-------
 7 files changed, 48 insertions(+), 53 deletions(-)
---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260526-sc7280-tx-macro-1179d786af1f

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

