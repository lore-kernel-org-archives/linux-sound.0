Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFAE2DCF7D;
	Wed, 11 Mar 2026 04:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773204192; cv=none; b=LOQ1N8F08bhzZ37P0DrYnNEE/aJMUNbihr0E/KNLiFchFqnnEmZzhLkflMcHmOYbt25nouCwa2uAff37wWSnnThXsWXrp/OAxL3pZruvFzsfGITHwyr8W4Qq/1lUoqEQbTOIzGI6mWkXMytI/dDBveQ9e74EfTYXDc/DeH4e+iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773204192; c=relaxed/simple;
	bh=zuYLCHRQi8qZmZK3IwFGsIfhkxkf/d7cInSMIcOxM3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lf9YRkqHZN/x0tQLn6Q7AwFZsloBnGWefchAXI1htWauiLIl7kAbhv6d5DoLeEUtnMv1kmTKOd+rYxYtIZyodQIfQXL3+Ftfp424Ex4jw+aLKWRazQfLA1JLVoc3kUzR9fCOC4/eh2IQe8f+b4ot5lEWH70g1JEYEr1bgq2nyw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p4ZYddCn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p4ZYddCn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2A9CC116C6;
	Wed, 11 Mar 2026 04:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773204191;
	bh=zuYLCHRQi8qZmZK3IwFGsIfhkxkf/d7cInSMIcOxM3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=p4ZYddCnO9euISF4q0nzFMr4tskHg7e8o/FqXd8uqCbo7feTBUxAJNYlx/sTqOa5S
	 zFbCLMED70vnJgRw12CyKGVHNfPeFFsdnqFLrFYg9ioU++8BpieioOoJ4UoCOX2hne
	 v/DT5S71mfsgxR4LI0gsWW7YRkOb9GNmJH4hl5P0Yo1i7MOQN4at/gOItxtjhZ243i
	 YGLD3344I9ss7ZePJkwIYb7EhUIjPN9DxCx7hsJBByHIvBSxF7Zsfl4mnnY7lJ9TK/
	 VEs+MRks2jlYUoJf3SNNuaEqDVfZqbH6J7JphcRQgvleFQtKjNbWEng8qgvOloDeiD
	 +Nw7znuLWc8Aw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A394AFD88F5;
	Wed, 11 Mar 2026 04:43:11 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 10 Mar 2026 23:43:04 -0500
Subject: [PATCH 1/2] ASoC: dt-bindings: Document firmware-name for
 awinic,aw88166
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-aw88166-fw-v1-1-2777563bb673@gmail.com>
References: <20260310-aw88166-fw-v1-0-2777563bb673@gmail.com>
In-Reply-To: <20260310-aw88166-fw-v1-0-2777563bb673@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Weidong Wang <wangweidong.a@awinic.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773204187; l=931;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=5MENRQH/Gn9FHW4tDRmUH1zYG53L9x/XxcifmwYU0Pw=;
 b=s3LgnJhJbb3oEy7LhdVGErl79GN/ajbCEOc6yqX52Lzy4pOGM9j7/dyeNFgbBt75fXJNKvlB0
 0xhxbxGy9mZCc/2e4ET/ocD67saePKBP6s4Ond/6mKxN0gmDnZLdHXH
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The driver currently loads a hardcoded firmware. Allow devices to
provide specifically tuned firmware, so the driver can use that instead.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 Documentation/devicetree/bindings/sound/awinic,aw88395.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
index 994d68c074a9f221576a5bfef6ba125e3e30bfea..e12d030475e24dd11afaa3c9af4b53703f25f981 100644
--- a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
+++ b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
@@ -48,6 +48,9 @@ properties:
       Flag bit used to keep the phase synchronized in the case of multiple PA
     $ref: /schemas/types.yaml#/definitions/flag
 
+  firmware-name:
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.53.0


