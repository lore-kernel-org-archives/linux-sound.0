Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GxV6WBDn"
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47571170B
	for <linux-sound@vger.kernel.org>; Fri,  1 Dec 2023 05:53:37 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50bbfad8758so2936629e87.3
        for <linux-sound@vger.kernel.org>; Fri, 01 Dec 2023 05:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701438815; x=1702043615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P7K5IV7jdfgIwO6ukGuP2RwaX7x4/Mv+9On20bS7YMg=;
        b=GxV6WBDnZPscq5Pu26Z5Cl4jQHZdAitXwQa6wslIUbNMO1dWf6T3elmYL+A9CPSCu6
         6npNL4JPtsgmtg57pZ/ZVDlHadHbW5YNSjd8a517yv07edJp9lHmFZ9atH/Fm13gYiay
         GmOo2qJ3AGFQPqp7zny20tYAeEXefJy29/qubLGk/DduszDOMhYiBh7wC1CSRaTb5g82
         1xWOxr+OLcDljho749YgIf9TXpFA5K/oJf4iQxYgydwbeL+yA9rbg6MPjbVrmJ2Dsh6z
         YhLY7PxFdDeoyceekGNXQDBxcYnQIXgdH6MZosskiB8h8whPqpNdwYPWmpaQDDsIFqEw
         u97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701438815; x=1702043615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7K5IV7jdfgIwO6ukGuP2RwaX7x4/Mv+9On20bS7YMg=;
        b=aHujmgIyDI1tTXXJnFc7VTuDTeEKZxiQqv/pvNLXa5/CUWjN0A0MvvrZx+bejnfee5
         di4+zY2SdB+4AvCjIutRaGiqzz9PlzOMSOI8PAa3tgIznyr3LdICRtwzCYkAYsBI7fXp
         HkN/gKtTUQPSalvQtuGsMmEOpg5RmhGsG/VfqupdEt6XRNWeZhZOPHjg3dau09z4F/p1
         Nkq/q+tVBcaNvX5TWthyUmLR8JAcsW3cz3TTYsNUqlOR4vkswOrIKbVoIh7Wt+OH9TN2
         Ks/0G1R+iMsC+blRLs5moLA026JVhr3bkHrZBcX4mx6A9YMXIglHNLRPgtNVAULOC/xp
         aZmQ==
X-Gm-Message-State: AOJu0YxK2mrqtEs6mZ58oNbnIYokJylpJQ33WL3W2RxOxSpiY71AqXAH
	OBqfoz3DLfJ8nHX7JRw0AxHCSw==
X-Google-Smtp-Source: AGHT+IEacAtD9giIRCaITOlBrlQe56T1GJ0qBYxW6GO25Dtmjc8UIVW3w/USQrHdEQXdcy/BGYheAQ==
X-Received: by 2002:a05:6512:48ce:b0:50b:d944:c049 with SMTP id er14-20020a05651248ce00b0050bd944c049mr357349lfb.267.1701438815464;
        Fri, 01 Dec 2023 05:53:35 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id d20-20020a056402001400b0054b531907f8sm1643159edu.73.2023.12.01.05.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:53:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ASoC: qcom: sc8280xp: set card driver name from match data
Date: Fri,  1 Dec 2023 14:53:31 +0100
Message-Id: <20231201135332.154017-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sound machine drivers for all newer Qualcomm SoC platforms are the
exactly same, therefore it makes sense to use same machine driver for
newer platforms as well.  Choice of sound topology and user-space Alsa
UCM files depends however on card driver name, which must be customized
per each board.  Allow such customization by using driver match data as
sound card driver name.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/sc8280xp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index d93b18f07be5..7df28ecefd65 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -14,8 +14,6 @@
 #include "common.h"
 #include "sdw.h"
 
-#define DRIVER_NAME		"sc8280xp"
-
 struct sc8280xp_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
 	struct snd_soc_card *card;
@@ -133,13 +131,13 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	card->driver_name = DRIVER_NAME;
+	card->driver_name = of_device_get_match_data(dev);
 	sc8280xp_add_be_ops(card);
 	return devm_snd_soc_register_card(dev, card);
 }
 
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
-	{.compatible = "qcom,sc8280xp-sndcard",},
+	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
 	{}
 };
 
-- 
2.34.1

