Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38B72FBDFD;
	Fri, 24 Apr 2026 02:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776999078; cv=none; b=utk6CUrBzS6Tm4MqPrZCR1qmHnPW2fFUoGwMJD0X4npSu4a/UagY4WKJx9yqpNi4/agzZxwW3BggXgu6f+x77lPc8gVZAn15IGiEhg/53ZJ0hdQ0gk2WNk7s4sVTHJD93EEJmU0XJzLDV/R3qL/EL9woncAug/i6YQ2KO6D1L/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776999078; c=relaxed/simple;
	bh=CIbqoCpGK9adH8q/AtaFqJAFfQZA8LBejUrXq2ZlVos=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TkFuJSqwMSYc5rnwODtdr7GzsRx0pqYsmCM/O3LNTs8C+WGIJ+WnueQNNfjKTZlpbAKzv7cNN2sQbpRw+0PKHlX69ItWS7d8LoDrz5NPD1EtZUZSZd6r3TIGrFA7E/qXREtzsQ9O72g2aZ6DDk5ovDjzcO3UnXYuX+tbPw4jM9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wG6dG-000000002SF-09LZ;
	Fri, 24 Apr 2026 02:51:06 +0000
Date: Fri, 24 Apr 2026 03:50:58 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 9/9] ARM: dts: mediatek: mt7623n-bananapi-bpi-r2: add HDMI
 audio machine node
Message-ID: <30f71787e8e438ed12c27b98c1dc3e0c1ca81155.1776998727.git.daniel@makrotopia.org>
References: <cover.1776998727.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1776998727.git.daniel@makrotopia.org>

Instantiate the mediatek,mt2701-hdmi-audio machine on the
BananaPi BPI-R2, binding the AFE HDMI playback path to the
on-chip HDMI transmitter acting as the generic HDMI codec.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v3: no changes
v2: no changes

 arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts
index a37f3fa223c7..139a76764faa 100644
--- a/arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts
@@ -132,6 +132,13 @@ memory@80000000 {
 		device_type = "memory";
 		reg = <0 0x80000000 0 0x80000000>;
 	};
+
+	sound-hdmi {
+		compatible = "mediatek,mt7623n-hdmi-audio",
+			     "mediatek,mt2701-hdmi-audio";
+		mediatek,platform = <&afe>;
+		mediatek,audio-codec = <&hdmi0>;
+	};
 };
 
 &bls {
-- 
2.54.0
