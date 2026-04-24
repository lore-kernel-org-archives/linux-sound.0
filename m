Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD2C2E3AF1;
	Fri, 24 Apr 2026 02:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776999068; cv=none; b=iFvJY53XA42kyY5EWJ7FLG2dgKpSBlHar+gGMH4lnuBCBELfMtDxzHppn1/YX0s5RFwsG8M5Td0p89hAj0cHsDcx83O1PYrT6qrypKWQiFZNt4fJdZT61WDzkMPSDTOH0Tzu1AjuwQ5R45CUq+OocckSkzbazFYdBWWWA0sp4AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776999068; c=relaxed/simple;
	bh=CS3J8VZWW9nKd/fVcyQCMRpG/Rqggn1vq0Uf/ahU//s=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XrUfadDeYgKUPPLpR4dl7FGAtXBh0laFGn8NmZsB8ULWy0ZwQNFjpxummKrou+CmUJ/4cjf3p1TK/GXNTMU0eMnwipRvjLlX7Vw9kulO588nh0DgzKfWmLvfZX6l1jp9ljcP0KKZA2tfxsN5/Pmr0OIR922S5An38Olq8spBR2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wG6d4-000000002Ri-1eCA;
	Fri, 24 Apr 2026 02:50:54 +0000
Date: Fri, 24 Apr 2026 03:50:46 +0100
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
Subject: [PATCH v3 8/9] ARM: dts: mediatek: mt7623: wire HDMI audio path
 clocks into AFE
Message-ID: <5dba44c0f9b63c6b97119eabaaff92768d6295bf.1776998727.git.daniel@makrotopia.org>
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

Mirror the MT2701 change for the MT7623 SoC dtsi: add HADDS2PLL,
audio_hdmi, audio_spdf and audio_apll to the AFE clocks list and
reparent the AUDPLL mux to HADDS2PLL_98M. Required for HDMI audio
on MT7623N boards via the shared mt2701 AFE driver.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v3: no changes
v2: no changes

 arch/arm/boot/dts/mediatek/mt7623.dtsi | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/mediatek/mt7623.dtsi
index 71ac2b94c6ba..4eb028ffee6f 100644
--- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
@@ -665,7 +665,11 @@ afe: audio-controller {
 				 <&audsys CLK_AUD_AFE_CONN>,
 				 <&audsys CLK_AUD_A1SYS>,
 				 <&audsys CLK_AUD_A2SYS>,
-				 <&audsys CLK_AUD_AFE_MRGIF>;
+				 <&audsys CLK_AUD_AFE_MRGIF>,
+				 <&topckgen CLK_TOP_HADDS2PLL_294M>,
+				 <&audsys CLK_AUD_HDMI>,
+				 <&audsys CLK_AUD_SPDF>,
+				 <&audsys CLK_AUD_APLL>;
 
 			clock-names = "infra_sys_audio_clk",
 				      "top_audio_mux1_sel",
@@ -700,15 +704,22 @@ afe: audio-controller {
 				      "audio_afe_conn_pd",
 				      "audio_a1sys_pd",
 				      "audio_a2sys_pd",
-				      "audio_mrgif_pd";
+				      "audio_mrgif_pd",
+				      "hadds2pll_294m",
+				      "audio_hdmi_pd",
+				      "audio_spdf_pd",
+				      "audio_apll_pd";
 
 			assigned-clocks = <&topckgen CLK_TOP_AUD_MUX1_SEL>,
 					  <&topckgen CLK_TOP_AUD_MUX2_SEL>,
 					  <&topckgen CLK_TOP_AUD_MUX1_DIV>,
-					  <&topckgen CLK_TOP_AUD_MUX2_DIV>;
+					  <&topckgen CLK_TOP_AUD_MUX2_DIV>,
+					  <&topckgen CLK_TOP_AUDPLL_MUX_SEL>;
 			assigned-clock-parents = <&topckgen CLK_TOP_AUD1PLL_98M>,
-						 <&topckgen CLK_TOP_AUD2PLL_90M>;
-			assigned-clock-rates = <0>, <0>, <49152000>, <45158400>;
+						 <&topckgen CLK_TOP_AUD2PLL_90M>,
+						 <0>, <0>,
+						 <&topckgen CLK_TOP_HADDS2PLL_98M>;
+			assigned-clock-rates = <0>, <0>, <49152000>, <45158400>, <0>;
 		};
 	};
 
-- 
2.54.0
