Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936FB1F584C
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 01:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759800375; cv=none; b=DbJWv0oGa2xKm9Y15DB1mfvqH+8pQLCQrdd2KXtMaSEhwP4cgZfs8LmAoUw5OWU6udVZVYkJMmkMZbUSx7WuA36X8EfygoWE3YJxAFXUfVtQCcbPcLpdsBzYAyJGpP2fKf69zXclATf3ind2OIr6/W69Bx6tgsmldwsqruXI57A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759800375; c=relaxed/simple;
	bh=16DquKhHf4rKURRSNctoiZxsdCnEHoGlUqmScEx09GE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P140Ta+2wT+BZvYpT/G7nI+AEpV4UNjv1e4p+dQAwl604cEUxnHK7XImEmHP9k/A8nY6PY2FWEryySjvKQ9ZLpIrAB09e/aLT+Y+Jl3JrI72AgyRIFg0YqH5tSnilOFergLvVf9ieqDzmOa3cH7QaBDoUBuF43VBtyMeoQqkiB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S0dVm77e; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S0dVm77e"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e4473d7f6so34387745e9.1
        for <linux-sound@vger.kernel.org>; Mon, 06 Oct 2025 18:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759800371; x=1760405171; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oSNduwIg7jI6jqDFPflXbxR6x1FoXK0RkqCfhQ+iHV4=;
        b=S0dVm77eoTZP1SINrrdGH3u9KkYmYstgGSLMvi6VbH5zztldflqG5ErMqizS6X4ocl
         ng8uWjJOBEtIyFCbXUHbRZdnYeBPzKYNZZKUvrmTZX5qHN2FeYYR27VxIGVk26uxdKKP
         YqjI8NS/AvSj2l3c3KDGsG677K3VF8tEMWIa9rk2LZwpMkp/CxquvCX6Ow4JbKWJjdox
         0ncGTFvkYT2e+AIdC/wzPE59GbijlVrJsyHamujulHk+tiGudrM/rfCRchrFF8U+JLts
         DSTHFIpIE/doTAauq7KLTcKYid+peWzYDid1D1uMY8+BQdvJAER9fyu9ArfiHjm9z1Pn
         hlfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759800371; x=1760405171;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSNduwIg7jI6jqDFPflXbxR6x1FoXK0RkqCfhQ+iHV4=;
        b=KIgKpyBcuNuL8LHCbbJKMkDmbuKm3hZQxBi7xojBvstKOmzsvIQkEKHUM53C6sQ7PJ
         2sjzPoyV/tVPCGMnnknzcro9SAfzMCH0E8/z5KgE4CMx2POsaVR0og8MQ0dqOFm2nK/Y
         pD+S1+neYuo+WIY2SmchgLf/DIlwa8bGZoqvTyIScrv0n3idAYliwhwIK87+XXm5ZvGf
         +XdobQdGiJOr5C5rEP8lyqX0IJx0FaOepJq5P2hMAwWNVReygLh1OO+e2kKViWgdofpv
         RLphkgumqTIqqXBNkBCNDzl0uza7OVPTRmnGV00n2QFO+RJkH5LuIv+T/pInEgkOM9ya
         ENWA==
X-Forwarded-Encrypted: i=1; AJvYcCXpPiy4//w9PVCvI5AXSFRnlXJyhDPlCCwK78ruI5lT7aO+Be/GTOSxc4bl6wfZTwYsVWuG7yYZiaTAGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+QHNDzH+8B+/PNw5IoHLsSnvXTm5WpM69DUplBYSrb3+20ttd
	roC/DqAMxVFipWnMzL24+FqRQ6nmkbw9+NMOJZuqD0+yL+geH/tXoLMfx14RsLQIsCk=
X-Gm-Gg: ASbGncsCjOSZiv0mRGTOs7TODClvUUlLKm/R6eFaYPcoWAuofcm2jjjBX6M1cGilSMc
	KWwxxdx7XkADN436KdqJjwQycLTfoWtflGPbdCRI52XIKCsseRTfGOLz16PWWBh13deTPrS96/4
	yZP2U2gr2pTfZvCqocv2PJxtQp8iF06FdsU4BiCEDSeSwClu8tOI/dUxCveLjnMp0kRbDPDmQ2k
	J+BNME8ftYZvtG9QgysAvjA90rQhUOu4M+hSsuDX0L1sZEK3WmDUxWGDT2zKvy073+QWFgpNDn8
	gYHqxBj4Toa9So0+ZHlzl7ZLVOnxQlPvc+Jb+HD5gUldTNeE/JT6j8HWJgpzCBgN7qPv14H0AWp
	eohkTMPIrkX4A9d9l/XJJ91BTKAslPXUUDqoS9EjhxdVZ95g2anDtUPfsR9cKDBHp9MU=
X-Google-Smtp-Source: AGHT+IEqCjJVNQ+4Qs4Y8SQUQR2vF3o2dNkE/MGT5wV1/bzYlB/WElOfwkhccFVlq2M0O2ZMoNgvfw==
X-Received: by 2002:a05:600c:350b:b0:459:e398:ed89 with SMTP id 5b1f17b1804b1-46e710fe3a0mr87258455e9.1.1759800370875;
        Mon, 06 Oct 2025 18:26:10 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:22ae:baa0:7d1a:8c1f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa2d52a71sm7410915e9.1.2025.10.06.18.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 18:26:09 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 0/2] Sndcard compatible for qrb2210/qcm2290
Date: Tue, 07 Oct 2025 02:26:06 +0100
Message-Id: <20251007-qrb2210-qcm2290-sndcard-v1-0-8222141bca79@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC9s5GgC/x3MwQqDMAyA4VeRnBdIM8twrzJ2iG10OdjNFEQQ3
 33F43f4/wOqummFZ3eA62bVvqUh3DpIHymzouVmYOIYiB64+sgcCNe0MA+EteQknjFL7LmPInq
 foNU/18n26/x6n+cfXO2mxmkAAAA=
X-Change-ID: 20251007-qrb2210-qcm2290-sndcard-da54245aae3f
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

This is a small patch series that serves as a preparation for
adding HDMI audio playback support on QRB2210 RB1 board.
The patches here are for sound subsystem. The other series
will focus on qcom DT files.

The previous series where one of the patches here were taken from is
https://lore.kernel.org/linux-sound/20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org/
and sndcard compable patch was added as new one. Both are basically
done as new ones.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (2):
      dt-bindings: sound: qcom,sm8250: add QRB2210 and RB1 soundcards
      ASoC: qcom: sm8250: add qrb2210-sndcard compatible string

 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 5 +++++
 sound/soc/qcom/sm8250.c                                  | 1 +
 2 files changed, 6 insertions(+)
---
base-commit: 4a71531471926e3c391665ee9c42f4e0295a4585
change-id: 20251007-qrb2210-qcm2290-sndcard-da54245aae3f

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

